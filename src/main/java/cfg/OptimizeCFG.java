package cfg;

import ast.Function;
import llvm.*;
import mini.MiniCompiler;
import java.util.ArrayList;

import static cfg.Cfg.ssa;

public class OptimizeCFG {

    // create an array of functions to inline and then when we loop through to print instructions
    // check for function calls and if it is one of these functions then inline the function, only if the function
    // is not a recursive call to itself or this would create an infinite loop within itself, this also might provide
    // a potential for another optimization


    public static ArrayList<String> funcsToInline = new ArrayList<>();

    public static void analyzeFunction (Cfg func) {
        // function must be one block in length not including entry or exit block
        if(func.block_count == 1) {
            for (CfgNode n: func.node_list) {
                // find the block that is not exit or entry node
                if (!(n.equals(func.exit_node) || n.equals(func.entry_node))) {
                    // must check to make sure that the block is not massive because we do not want to create spillz
                    if (n.llvm_instructions.size() < 5) {
                        // do not inline if there is another function call within that function
                        for (InstructionLLVM i: n.llvm_instructions) {
                            if (i instanceof CallLLVM) {
                                return;
                            }
                        }

                        funcsToInline.add(func.func_name);
                    }
                }
            }
        }


    }

    public static boolean containsFunc(String func_name) {
        for(String func: funcsToInline) {
            if (func.equals(func_name)) {
                return true;
            }
        }

        return false;
    }

    public static ExprReturn inlineCall (CfgNode blk, CallLLVM call)  {

        cfg.Cfg cur = null;
        ExprReturn ret = null;
        for(Function f: MiniCompiler.program.funcs) {
            if (f.name.equals(call.fnptrval)) {
                cur = new cfg.Cfg(f, true, call);
            }
        }


        for (CfgNode eval_blk: cur.node_list) {
            if (!(cur.entry_node.equals(eval_blk) || cur.exit_node.label.equals(eval_blk.label))) {
                // once all of the registers that utilize locals or parameters are changed to reflect inlining
                // we can then inline the instructions and replace the return instruction by immediately replacing the function call result with
                // the value calculated inline

                for (InstructionLLVM i : eval_blk.llvm_instructions) {
                    if (!(i instanceof BrLabelLLVM || i instanceof BrLLVM || i instanceof RetLLVM || i instanceof RetVoidLLVM)) {
                        blk.llvm_instructions.add(i);
                    }
                }
                // store retval in the where the call result would be
            }

            if(eval_blk.llvm_instructions.size() == 0) {
                if(cur.exit_node.phis.size() == 1) {
                    InstructionLLVM phi = cur.exit_node.phis.get(0);
                    ExprReturn name = ((PhiLLVM)phi).value_block_pairs.get(0).name;
                    ssa.writeVariable(cur.exit_node, "_retval_", name);

                    for (InstructionLLVM cur_inst : cur.exit_node.llvm_instructions) {
                        if (cur_inst.getInstruction() != null) {
                            if (cur_inst.getInstruction().contains(((PhiLLVM)phi).result.reg_name)) {
                                cur_inst.setInstruction(cur_inst.getInstruction().replace(((PhiLLVM)phi).result.reg_name, ((PhiLLVM)phi).value_block_pairs.get(0).name.toString()));
                                cur.exit_node.llvm_instructions.remove(0);
                                cur.exit_node.llvm_instructions.add(cur_inst);
                            }
                        }
                    }

                }

            }


            if (!(call.result == null)) {
                ret = cur.exit_node.curDef.get("_retval_");
            }

        }

        return ret;
    }
}
