package cfg;

import ast.*;
import llvm.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import static mini.MiniCompiler.ParamSpecifier.Stack;
import static mini.MiniCompiler.blockNum;
import static mini.MiniCompiler.no_opt;
import static mini.MiniCompiler.user_spec;


public class Cfg {

    public CfgNode entry_node = new CfgNode("bbentry");
    public CfgNode exit_node = new CfgNode("bbexit");
    public String func_header;
    public int exit_num;
    public int block_count;
    public static SSA ssa = new SSA();
    public ArrayList<CfgNode> node_list = new ArrayList<>();
    private List<PhiLLVM> all_phis_working = new ArrayList<>();
    public String func_name;
    public List<Declaration> func_params;
    public TypeLLVM func_ret;

    public Cfg(ast.Function f, boolean is_inline, CallLLVM call) {
        func_params = f.params;
        exit_num = blockNum++;
        node_list.add(entry_node);
        CreateCfg(f, is_inline, call);
        node_list.add(exit_node);

        OptimizeCFG.analyzeFunction(this);
        RegAlloc.allocateRegisters(this);
    }

    public static ArrayList<CfgNode> sealed_blocks = new ArrayList<>();

    // first statement type of every function is a block statement
    private void CreateCfg(ast.Function f, boolean is_inline, CallLLVM call) {
        func_name = f.name;
        func_ret = f.retType.getLLVMType();
        if (f.body instanceof BlockStatement) {
            CfgNode cn = AddNewBB(entry_node);
            // allocate and add all locals and parameters to new block
            PopulateFunc(cn, f, is_inline, call);
            CfgNode return_from_origin = AnalyzeStatement(cn, f.body, f);

            if (!return_from_origin.equals(exit_node)) {
                return_from_origin.sucs.add(exit_node);
                exit_node.preds.add(return_from_origin);
                BrLabelLLVM brl = new BrLabelLLVM("bb" + exit_num);
                return_from_origin.llvm_instructions.add(brl);
            }

            if(!(f.retType instanceof VoidType)) {
                if(!(user_spec == Stack)) {
                    ExprReturn rt = ssa.readVariable(exit_node, "_retval_", f.retType.getLLVMType());
                    RetLLVM ret_reg = new RetLLVM(rt);
                    exit_node.llvm_instructions.add(ret_reg);
                } else {
                    LoadResultLLVM l_reg = new LoadResultLLVM(f.retType.getLLVMType());
                    RetLLVM ret_reg = new RetLLVM(l_reg.result);
                    exit_node.llvm_instructions.add(l_reg);
                    exit_node.llvm_instructions.add(ret_reg);
                }

            } else {
                RetVoidLLVM rv = new RetVoidLLVM();
                exit_node.llvm_instructions.add(rv);
            }
        } else {
            System.err.println("Block statement expected at the beginning of each function");
            System.exit(1);
        }

        if(!(user_spec == Stack)) {
            sealAllBlocks();
            ssa.sealBlock(exit_node);
//            removeTrivialPhis();
        }

    }

    // takes origin block and creates a new block
    private CfgNode AddNewBB(CfgNode org) {
        CfgNode nn = new CfgNode("bb"+ blockNum);
        blockNum++;
        org.sucs.add(nn);
        nn.preds.add(org);
        block_count++;
        node_list.add(nn);
        return nn;
    }

    private CfgNode AnalyzeStatement(CfgNode cur, Statement s, ast.Function f) {
        if (s instanceof BlockStatement) {
            BlockStatement blk = (BlockStatement) s;
            for (Statement sp : blk.statements) {
                cur = AnalyzeStatement(cur, sp, f);
                if (cur == exit_node) {
                    return exit_node;
                }
            }
            return cur;
        } else if (s instanceof PrintLnStatement) {
            // evaluate the println expression but return the current block still
            PrintLnStatement actual_s = (PrintLnStatement)s;

            // pass the block into expressions and put the expressions in the block
            // throw the instructions in the block
            ExprReturn rt = actual_s.expression.getLLVM(cur, f);
            if (rt instanceof Register) {
                Register reg = (Register) rt;
                PrintflnLLVM p = new PrintflnLLVM(reg);
                cur.llvm_instructions.add(p);
            } else {
                ImmediateLLVM imm = (ImmediateLLVM) rt;
                PrintflnLLVM p = new PrintflnLLVM(imm);
                cur.llvm_instructions.add(p);
            }

            return cur;
        } else if (s instanceof PrintStatement) {
            // evaluate the print expression but return the current block still
            PrintStatement actual_s = (PrintStatement)s;

            // pass the block into expressions and put the expressions in the block
            // throw the instructions in the block
            ExprReturn rt = actual_s.expression.getLLVM(cur, f);
            if (rt instanceof Register) {
                Register reg = (Register) rt;
                PrintfLLVM p = new PrintfLLVM(reg);
                cur.llvm_instructions.add(p);
            } else {
                ImmediateLLVM imm = (ImmediateLLVM) rt;
                PrintfLLVM p = new PrintfLLVM(imm);
                cur.llvm_instructions.add(p);
            }

            return cur;
        } else if (s instanceof DeleteStatement) {
            // evaluate the delete expression but return the current block still
            DeleteStatement actual_s = (DeleteStatement)s;

            // pass the block into expressions and put the expressions in the block
            // throw the instructions in the block
            Register r = (Register) actual_s.expression.getLLVM(cur, f);
            BitcastLLVM b = new BitcastLLVM(r, new IEightLLVM());
            FreeLLVM free = new FreeLLVM(b.result);
            cur.llvm_instructions.add(b);
            cur.llvm_instructions.add(free);
            return cur;
        } else if (s instanceof InvocationStatement) {
            // evaluate the invocation expression but return the current block still
            InvocationStatement actual_s = (InvocationStatement)s;

            // pass the block into expressions and put the expressions in the block
            // throw the instructions in the block
            actual_s.expression.getLLVM(cur, f);
            return cur;
        } else if (s instanceof AssignmentStatement) {
            // evaluate the assignment expression but return the current block still
            AssignmentStatement a_state = (AssignmentStatement)s;

            // pass the block into expressions and put the expressions in the block
            // throw the instructions in the block
            ExprReturn er = a_state.source.getLLVM(cur, f);
            if (a_state.target instanceof LvalueDot) {
                if(er instanceof Register) {
                    // er reg cotains the source for the assignment
                    Register er_reg = (Register) er;
                    LvalueDot ldot = (LvalueDot) a_state.target;
                    Register reg_lft = (Register) ldot.left.getLLVM(cur, f);
                    StructPtrLLVM hld1 = (StructPtrLLVM) reg_lft.reg_type;
                    HashMap<String, StructField> cur_tbl = Program.struct_table.get(hld1.getStructName());

                    GetPtrLLVM gptr;
                    StoreLLVM store;
                    if (er_reg.reg_name.equals("null")) {
                        gptr = new GetPtrLLVM(reg_lft, hld1, cur_tbl.get(ldot.id).type.getLLVMType(), cur_tbl.get(ldot.id).index);
                        store = new StoreLLVM(reg_lft.reg_type, "null", reg_lft.reg_type, gptr.result.reg_name);
                    } else {
                        gptr = new GetPtrLLVM(reg_lft, hld1, cur_tbl.get(ldot.id).type.getLLVMType(), cur_tbl.get(ldot.id).index);
                        store = new StoreLLVM(er_reg.reg_type, er_reg.reg_name, er_reg.reg_type, gptr.result.reg_name);
                    }

                    cur.llvm_instructions.add(gptr);
                    cur.llvm_instructions.add(store);

                } else {
                    // handle for immediate
                    ImmediateLLVM er_imm = (ImmediateLLVM) er;
                    LvalueDot ldot = (LvalueDot) a_state.target;
                    Register reg_lft = (Register) ldot.left.getLLVM(cur, f);
                    StructPtrLLVM hld1 = (StructPtrLLVM) reg_lft.reg_type;
                    HashMap<String, StructField> cur_tbl = Program.struct_table.get(hld1.getStructName());

                    GetPtrLLVM gptr;
                    StoreLLVM store;
                    if (!(user_spec == Stack)) {
                         gptr = new GetPtrLLVM(reg_lft, hld1, cur_tbl.get(ldot.id).type.getLLVMType(), cur_tbl.get(ldot.id).index);
                         store = new StoreLLVM(new IntLLVM(), er_imm.num, new IntLLVM(), gptr.result.reg_name);
                    } else {
                         gptr = new GetPtrLLVM(reg_lft, hld1, cur_tbl.get(ldot.id).type.getLLVMType(), cur_tbl.get(ldot.id).index);
                         store = new StoreLLVM(new IntLLVM(), er_imm.num, new IntLLVM(), gptr.result.reg_name);
                    }

                    cur.llvm_instructions.add(gptr);
                    cur.llvm_instructions.add(store);
                }
            } else {
                // assignment to LvalueID: for SSA must read variable
                if (er instanceof Register) {
                    Register er_reg = (Register) er;
                    LvalueId ldot = (LvalueId) a_state.target;

                    SymbolEntry se = null;
                    if (f.local_symbol_table.containsKey(ldot.id)) {
                        se = f.local_symbol_table.get(ldot.id);
                    } else if (Program.glob_symbol_table.containsKey(ldot.id)) {
                        se = Program.glob_symbol_table.get(ldot.id);
                    } else {
                        System.err.println("Assignment target not previously declared in scope.");
                        System.exit(1);
                    }

                    // se is the return from the symbol table of the target value
                    if (!(user_spec == Stack)) {
                        if (se.scope == SymbolEntry.Scope.GLOB) {
                            StoreLLVM store;
                            if (er_reg.reg_name.equals("null")) {
                                store = new StoreLLVM(se.type.getLLVMType(), "null", se.type.getLLVMType(), "@" + ldot.id);
                            } else {
                                store = new StoreLLVM(er_reg.reg_type, er_reg.reg_name, er_reg.reg_type, "@" + ldot.id);
                            }
                            cur.llvm_instructions.add(store);
                        } else {
                            ssa.writeVariable(cur, ldot.id, er_reg);
                        }

                    } else {
                        if (se.scope == SymbolEntry.Scope.PARAM) {
                            StoreLLVM store;
                            if (er_reg.reg_name.equals("null")) {
                                store = new StoreLLVM(se.type.getLLVMType(), "null", se.type.getLLVMType(), "%_P_" + ldot.id);
                            } else {
                                store = new StoreLLVM(er_reg.reg_type, er_reg.reg_name, er_reg.reg_type, "%_P_" + ldot.id);
                            }
                            cur.llvm_instructions.add(store);
                        } else if (se.scope == SymbolEntry.Scope.GLOB) {
                            StoreLLVM store;
                            if (er_reg.reg_name.equals("null")) {
                                store = new StoreLLVM(se.type.getLLVMType(), "null", se.type.getLLVMType(), "@" + ldot.id);
                            } else {
                                store = new StoreLLVM(er_reg.reg_type, er_reg.reg_name, er_reg.reg_type, "@" + ldot.id);
                            }
                            cur.llvm_instructions.add(store);
                        } else {
                            StoreLLVM store;
                            if (er_reg.reg_name.equals("null")) {
                                store = new StoreLLVM(se.type.getLLVMType(), "null", se.type.getLLVMType(), "%_" + ldot.id);
                            } else {
                                store = new StoreLLVM(er_reg.reg_type, er_reg.reg_name, er_reg.reg_type, "%_" + ldot.id);
                            }
                            cur.llvm_instructions.add(store);
                        }
                    }
                } else {
                    // handle for immediate
                    ImmediateLLVM er_imm = (ImmediateLLVM) er;
                    LvalueId ldot = (LvalueId) a_state.target;

                    SymbolEntry se = null;
                    if (f.local_symbol_table.containsKey(ldot.id)) {
                        se = f.local_symbol_table.get(ldot.id);
                    } else if (Program.glob_symbol_table.containsKey(ldot.id)) {
                        se = Program.glob_symbol_table.get(ldot.id);
                    } else {
                        System.err.println("Assignment target not previously declared in scope.");
                        System.exit(1);
                    }

                    if (!(user_spec == Stack)) {
                        if (se.scope == SymbolEntry.Scope.GLOB) {
                            StoreLLVM store = new StoreLLVM(new IntLLVM(), er_imm.num, se.type.getLLVMType(), "@" + ldot.id);
                            cur.llvm_instructions.add(store);
                        }
                        ssa.writeVariable(cur, ldot.id, er_imm);
                    } else {
                        if (se.scope == SymbolEntry.Scope.PARAM) {
                            StoreLLVM store = new StoreLLVM(new IntLLVM(), er_imm.num, se.type.getLLVMType(), "%_P_" + ldot.id);
                            cur.llvm_instructions.add(store);
                        } else if (se.scope == SymbolEntry.Scope.GLOB) {
                            StoreLLVM store = new StoreLLVM(new IntLLVM(), er_imm.num, se.type.getLLVMType(), "@" + ldot.id);
                            cur.llvm_instructions.add(store);
                        } else {
                            StoreLLVM store = new StoreLLVM(new IntLLVM(), er_imm.num, se.type.getLLVMType(), "%_" + ldot.id);
                            cur.llvm_instructions.add(store);
                        }
                    }
                }
            }


            return cur;
        } else if (s instanceof ReturnStatement) {
            // evaluate the return expression but return the current block still
            // get value from the expression and set as retval in block
            ReturnStatement actual_s = (ReturnStatement)s;
            ExprReturn er = actual_s.expression.getLLVM(cur, f);

            if(!(user_spec == Stack)) {
                if(er instanceof Register) {
                    Register er_reg = (Register)er;
                    ssa.writeVariable(cur, "_retval_", er_reg);
                } else {
                    ImmediateLLVM er_imm = (ImmediateLLVM)er;
                    ssa.writeVariable(cur, "_retval_", er_imm);
                }
            } else {
                if(er instanceof Register) {
                    Register er_reg = (Register)er;
                    StoreLLVM s_reg;
                    if(er_reg.reg_name.equals("null")) {
                        s_reg = new StoreLLVM(f.retType.getLLVMType(), "null", f.retType.getLLVMType(), "%_retval_");
                    } else {
                        s_reg = new StoreLLVM(er_reg.reg_type, er_reg.reg_name, er_reg.reg_type, "%_retval_");
                    }

                    cur.llvm_instructions.add(s_reg);
                } else {
                    ImmediateLLVM er_imm = (ImmediateLLVM)er;
                    StoreLLVM store = new StoreLLVM(new IntLLVM(), er_imm.num, new IntLLVM(), "%_retval_");
                    cur.llvm_instructions.add(store);
                }
            }

            BrLabelLLVM bre = new BrLabelLLVM("bb" + exit_num);
            cur.llvm_instructions.add(bre);
            cur.sucs.add(exit_node);
            exit_node.preds.add(cur);
            return exit_node;
        } else if (s instanceof ReturnEmptyStatement) {
            // no need to evaluate here
            BrLabelLLVM bre = new BrLabelLLVM("bb" + exit_num);
            cur.llvm_instructions.add(bre);
            cur.sucs.add(exit_node);
            exit_node.preds.add(cur);
            return exit_node;
        } else if (s instanceof ConditionalStatement) {
            CfgNode then_blk = AddNewBB(cur);
            CfgNode else_blk = AddNewBB(cur);

            ConditionalStatement cs = (ConditionalStatement) s;

            // add guard to current block
            ExprReturn guard_reg = cs.guard.getLLVM(cur, f);
            getBrLLVMInstruction(guard_reg, cur, then_blk, else_blk);

            // evaluate if guard expression and put in the original if block
            // check both then and else blocks for returns
            // connect non return blocks into a join block
            // otherwise return blocks will be connected to exit block

            CfgNode ret_then = AnalyzeStatement(then_blk, cs.thenBlock, f);
            CfgNode ret_else = AnalyzeStatement(else_blk, cs.elseBlock, f);


            if ((ret_then.label.equals(exit_node.label)) && (ret_else.label.equals(exit_node.label))) {
                return exit_node;
            } else if (ret_then.label.equals(exit_node.label)) {
                CfgNode join_node = AddNewBB(ret_else);
                BrLabelLLVM brl = new BrLabelLLVM(join_node.label);
                ret_else.llvm_instructions.add(brl);
                return join_node;
            } else if (ret_else.label.equals(exit_node.label)) {
                CfgNode join_node = AddNewBB(ret_then);
                BrLabelLLVM brl = new BrLabelLLVM(join_node.label);
                ret_then.llvm_instructions.add(brl);
                return join_node;
            } else {
                CfgNode join_node = AddNewBB(ret_then);
                ret_else.sucs.add(join_node);
                join_node.preds.add(ret_else);
                BrLabelLLVM brl = new BrLabelLLVM(join_node.label);
                ret_else.llvm_instructions.add(brl);
                ret_then.llvm_instructions.add(brl);
                return join_node;
            }
        } else if (s instanceof WhileStatement) {
            WhileStatement ws = (WhileStatement) s;

            // while conditional block contains the guard for the while loop
            CfgNode while_cond_blk = AddNewBB(cur);
            BrLabelLLVM bfl = new BrLabelLLVM(while_cond_blk.label);
            cur.llvm_instructions.add(bfl);
            ExprReturn guard_return = ws.guard.getLLVM(while_cond_blk, f);

            // Analyze the body of the while loop and get the block returned from the analysis
            CfgNode while_body_blk = AddNewBB(while_cond_blk);
            CfgNode ret_body = AnalyzeStatement(while_body_blk, ws.body, f);
            while_cond_blk.preds.add(ret_body);
            ret_body.sucs.add(while_cond_blk);

            // create a join node for when the guard is false and add conditional to the guard block
            CfgNode join_while_node = AddNewBB(while_cond_blk);
            getBrLLVMInstruction(guard_return, while_cond_blk, while_body_blk, join_while_node);

            // Must add a branch back to the while conditional for the loop
            BrLabelLLVM bcondl = new BrLabelLLVM(while_cond_blk.label);
            ret_body.llvm_instructions.add(bcondl);

            return join_while_node;

        } else {
            // should never get to this statement
            System.err.println("Invalid statement in ast");
            System.exit(1);
            return null;
        }
    }

    private void getBrLLVMInstruction(ExprReturn exret, CfgNode cur, CfgNode while_blk, CfgNode join_node) {
        if(exret instanceof Register) {
            Register er_reg = (Register)exret;

            if(!(er_reg.reg_type instanceof IOneLLVM)) {
                TruncLLVM trunc = new TruncLLVM(er_reg);
                cur.llvm_instructions.add(trunc);
                BrLLVM br_loop = new BrLLVM(trunc.result, while_blk.label, join_node.label);
                cur.llvm_instructions.add(br_loop);
            } else {
                BrLLVM br_loop = new BrLLVM(er_reg, while_blk.label, join_node.label);
                cur.llvm_instructions.add(br_loop);
            }

        } else {
            ImmediateLLVM er_imm = (ImmediateLLVM)exret;
            BrLLVM br_loop = new BrLLVM(er_imm, while_blk.label, join_node.label);
            cur.llvm_instructions.add(br_loop);
        }
    }

    private void PopulateFunc (CfgNode c, ast.Function f, boolean is_inline, CallLLVM call) {
        func_header = "define " + f.retType.getLLVMType().getName() + " @" + f.name + "(";

        if( !(user_spec == Stack) ){
            int i = 1;
            for(Declaration dec: f.params) {
                if(i == f.params.size()) {
                    func_header += dec.type.getLLVMType().getName();
                    func_header += " %";
                    func_header += dec.name;
                } else {
                    func_header += dec.type.getLLVMType().getName();
                    func_header += " %";
                    func_header += dec.name;
                    func_header += ", ";
                }
                i++;
            }
            func_header += ")\n{";
            if (!(f.retType instanceof VoidType)) {
                ssa.writeVariable(c, "_retval_", new Register(new IdLLVM("_retval_", f.retType.getLLVMType(), SymbolEntry.Scope.LOC)));
            }

            if(is_inline){
                int pos = 0;
                for (ExprReturn p : call.fnargs) {
                    Declaration decl = f.params.get(pos);
                    ssa.writeVariable(c, decl.name, p);
                    pos++;
                }

//                ssa.printCurDefForDebugging(c);
            } else {
                for(Declaration decl: f.params) {
                    if(decl.type.getLLVMType() instanceof StructPtrLLVM) {
                        StructPtrLLVM struct_ptr = (StructPtrLLVM)decl.type.getLLVMType();
                        ssa.writeVariable(c, decl.name, new Register(new IdLLVM(decl.name, decl.type.getLLVMType(), SymbolEntry.Scope.PARAM)));
                        ssa.writeVariable(c, decl.name, new Register(new IdLLVM(decl.name, decl.type.getLLVMType(), SymbolEntry.Scope.PARAM)));
                    } else {
                        ssa.writeVariable(c, decl.name, new Register(new IdLLVM(decl.name, decl.type.getLLVMType(), SymbolEntry.Scope.PARAM)));
                    }
                }
            }

            for(Declaration decl: f.locals) {
                if(decl.type.getLLVMType() instanceof StructPtrLLVM) {
                    StructPtrLLVM struct_ptr = (StructPtrLLVM)decl.type.getLLVMType();
                    ssa.writeVariable(c, decl.name, new Register(struct_ptr));
                } else {
                    ssa.writeVariable(c, decl.name, new Register(new IdLLVM(decl.name, decl.type.getLLVMType() ,SymbolEntry.Scope.LOC)));
                }
            }

        } else {
            int i = 1;
            for(Declaration dec: f.params) {
                if(i == f.params.size()) {
                    func_header += dec.type.getLLVMType().getName();
                    func_header += " %_";
                    func_header += dec.name;
                } else {
                    func_header += dec.type.getLLVMType().getName();
                    func_header += " %_";
                    func_header += dec.name;
                    func_header += ", ";
                }
                i++;
            }
            func_header += ")\n{";
            if (!(f.retType instanceof VoidType)) {
                AllocLLVM f_ret = new AllocLLVM(f.retType.getLLVMType(), "_retval_", SymbolEntry.Scope.LOC);
                c.llvm_instructions.add(f_ret);
            }

            for(Declaration decl: f.params) {
                AllocLLVM p = new AllocLLVM(decl.type.getLLVMType(), "%_P_" + decl.name, SymbolEntry.Scope.PARAM);
                c.llvm_instructions.add(p);
                StoreLLVM s = new StoreLLVM(decl.type.getLLVMType(), "%_"+decl.name, decl.type.getLLVMType(), "%_P_" + decl.name);
                c.llvm_instructions.add(s);
            }

            for(Declaration dec: f.locals) {
                AllocLLVM l = new AllocLLVM(dec.type.getLLVMType(), "_"+dec.name, SymbolEntry.Scope.LOC);
                c.llvm_instructions.add(l);
            }
        }

    }

    private void sealAllBlocks () {
        for(CfgNode cur: node_list) {
            if(!cur.sealed) {
//                ssa.printCurDefForDebugging(cur);
                ssa.sealBlock(cur);
            }
        }
    }

    private void removeTrivialPhis () {
//        System.out.println(Cfg.this.func_name);
        gatherAllPhis();
        List<PhiLLVM> trivial_set = splitTrivial();
//        System.out.println(this.func_name + " " + trivial_set.size());

        while(!(trivial_set.isEmpty())) {
//            System.out.println(this.func_name + " " + trivial_set.size());
            for(PhiLLVM p: trivial_set) {
                takeCareOfBlock(p);

                all_phis_working.remove(p);
                p.blk.incomplete_phis.remove(p);
                p.blk.phis.remove(p);
            }

            trivial_set = splitTrivial();
        }

    }

    private void takeCareOfBlock(PhiLLVM p) {
        for (CfgNode cur: node_list) {
            if (cur.label.equals(p.value_block_pairs.get(0).branch)) {
                for (InstructionLLVM inst : cur.phis) {
                    PhiLLVM phi = (PhiLLVM) inst;
//                    System.out.println(phi + " " + p.result.reg_name);
                    Tuple<ExprReturn, String> to_remove = null;
                    for (Tuple<ExprReturn, String> vbp : phi.value_block_pairs) {
                        if (vbp.name.toString().equals(p.result.reg_name)) {
                            to_remove = vbp;
//                            System.out.println(phi);
                        }
                    }
                    if (to_remove != null) {
                        phi.value_block_pairs.remove(to_remove);
                    }

                }

//                System.out.println(p.value_block_pairs.get(0).branch + " " + cur.label);
            }
        }
        // problem happens when there is a phi that comes form another phi
        for (CfgNode cur: node_list) {
            for (InstructionLLVM cur_inst : cur.llvm_instructions) {
                if (cur_inst.getInstruction() != null) {
                    if (cur_inst.getInstruction().contains(p.result.reg_name)) {
                        //                    System.out.println("        replace: "+ p.result.reg_name +"       replace with: " + p.value_block_pairs.get(0).name.toString() + " " + cur_inst);
                        cur_inst.setInstruction(cur_inst.getInstruction().replace(p.result.reg_name, p.value_block_pairs.get(0).name.toString()));
                        //                    System.out.println(cur_inst.getInstruction());
                    }
                }
            }

            for (InstructionLLVM cur_inst : cur.phis) {
                if (cur_inst.getInstruction() != null) {
                    if (cur_inst.getInstruction().contains(p.result.reg_name)) {
                        //                    System.out.println("        replace: "+ p.result.reg_name +"       replace with: " + p.value_block_pairs.get(0).name.toString() + " " + cur_inst);
                        cur_inst.setInstruction(cur_inst.getInstruction().replace(p.result.reg_name, p.value_block_pairs.get(0).name.toString()));
                        //                    System.out.println(cur_inst.getInstruction());
                    }
                }
            }
        }

        for (InstructionLLVM cur_inst : exit_node.llvm_instructions) {
            if (cur_inst.getInstruction() != null) {
                if (cur_inst.getInstruction().contains(p.result.reg_name)) {
                    //                    System.out.println("        replace: "+ p.result.reg_name +"       replace with: " + p.value_block_pairs.get(0).name.toString() + " " + cur_inst);
                    cur_inst.setInstruction(cur_inst.getInstruction().replace(p.result.reg_name, p.value_block_pairs.get(0).name.toString()));
                    //                    System.out.println(cur_inst.getInstruction());
                }
            }
        }

    }

    private void gatherAllPhis() {
        for(CfgNode cur: node_list) {
            for(InstructionLLVM cur_inst: cur.phis) {
//                System.out.println(cur_inst);
                if(cur_inst instanceof PhiLLVM) {
                    all_phis_working.add((PhiLLVM) cur_inst);
                }
            }
        }

        for(InstructionLLVM cur_inst: exit_node.phis) {
//                System.out.println(cur_inst);
            if(cur_inst instanceof PhiLLVM) {
                all_phis_working.add((PhiLLVM) cur_inst);
            }
        }
    }

    private List<PhiLLVM> splitTrivial() {
        List<PhiLLVM> trivial = new ArrayList<>();
        for(PhiLLVM cur_inst: all_phis_working) {
            if(cur_inst.value_block_pairs.size() == 1) {
                trivial.add(cur_inst);
            }
        }

        return trivial;
    }

}
