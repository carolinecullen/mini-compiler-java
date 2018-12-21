package cfg;

import llvm.*;

public class RegAlloc {

    static void allocateRegisters(Cfg cfg) {
        for (CfgNode cn: cfg.node_list) {
            computeGenKillSet(cn);
        }

        for (int j = cfg.node_list.size() - 1; j >= 0; j--) {
            computeLOSets(cfg.node_list.get(j));
        }

    }

    static private void computeGenKillSet(CfgNode cn) {
        for(InstructionLLVM phi: cn.phis) {
            for(Tuple<ExprReturn, String> vbp: ((PhiLLVM)phi).value_block_pairs) {
                cn.gen_set.add(vbp.name);
            }
            cn.kill_set.add(((PhiLLVM) phi).result);
        }

        for(InstructionLLVM instruct: cn.llvm_instructions) {
            if(instruct instanceof AddLLVM) {
                cn.kill_set.add(((AddLLVM) instruct).result);
                cn.gen_set.add(((AddLLVM) instruct).op1);
                cn.gen_set.add(((AddLLVM) instruct).op2);
            } else if (instruct instanceof AllocLLVM) {
                cn.kill_set.add(((AllocLLVM) instruct).result);
            } else if (instruct instanceof AndLLVM) {
                cn.kill_set.add(((AndLLVM) instruct).result);
                cn.gen_set.add(((AndLLVM) instruct).op1);
                cn.gen_set.add(((AndLLVM) instruct).op2);
            } else if (instruct instanceof BitcastLLVM) {
                cn.kill_set.add(((BitcastLLVM) instruct).result);
                cn.gen_set.add(((BitcastLLVM) instruct).from);
            } else if (instruct instanceof BrLabelLLVM) {
                // do nothing
            } else if (instruct instanceof BrLLVM) {
                cn.gen_set.add(((BrLLVM) instruct).reg);
            } else if (instruct instanceof CallLLVM) {
                cn.gen_set.addAll(((CallLLVM)instruct).fnargs);
                cn.kill_set.add(((CallLLVM)instruct).result);
            } else if (instruct instanceof FreeLLVM) {
                cn.gen_set.add(((FreeLLVM)instruct).reg);
            } else if (instruct instanceof GetPtrLLVM) {
                cn.gen_set.add(((GetPtrLLVM)instruct).ptrval);
                cn.kill_set.add(((GetPtrLLVM)instruct).result);
            } else if (instruct instanceof IcmpLLVM) {
                cn.kill_set.add(((IcmpLLVM) instruct).result);
                cn.gen_set.add(((IcmpLLVM) instruct).op1);
                cn.gen_set.add(((IcmpLLVM) instruct).op2);
            } else if (instruct instanceof LoadLLVM) {
                cn.kill_set.add(((LoadLLVM) instruct).result);
                cn.gen_set.add(((LoadLLVM) instruct).ptr);
            } else if (instruct instanceof LoadResultLLVM) {
                cn.kill_set.add(((LoadResultLLVM) instruct).result);
            } else if (instruct instanceof MallocLLVM) {
                cn.kill_set.add(((MallocLLVM) instruct).result);
            } else if (instruct instanceof MulLLVM) {
                cn.kill_set.add(((MulLLVM) instruct).result);
                cn.gen_set.add(((MulLLVM) instruct).op1);
                cn.gen_set.add(((MulLLVM) instruct).op2);
            } else if (instruct instanceof OrLLVM) {
                cn.kill_set.add(((OrLLVM) instruct).result);
                cn.gen_set.add(((OrLLVM) instruct).op1);
                cn.gen_set.add(((OrLLVM) instruct).op2);
            } else if (instruct instanceof PrintfLLVM) {
                cn.gen_set.add(((PrintfLLVM) instruct).reg);
            } else if (instruct instanceof PrintflnLLVM) {
                cn.gen_set.add(((PrintflnLLVM) instruct).reg);
            } else if (instruct instanceof ReadLLVM) {
                cn.kill_set.add(((ReadLLVM) instruct).result);
            } else if (instruct instanceof RetVoidLLVM) {
                // do nothing
            } else if (instruct instanceof RetLLVM) {
                cn.gen_set.add(((RetLLVM) instruct).reg);
            } else if (instruct instanceof SdivLLVM) {
                cn.kill_set.add(((SdivLLVM) instruct).result);
                cn.gen_set.add(((SdivLLVM) instruct).op1);
                cn.gen_set.add(((SdivLLVM) instruct).op2);
            } else if (instruct instanceof StoreLLVM) {
//                kill_set.add(((StoreLLVM) instruct).result);
//                gen_set.add(((StoreLLVM) instruct).op1);
            } else if (instruct instanceof TruncLLVM) {
                cn.kill_set.add(((TruncLLVM) instruct).result);
                cn.gen_set.add(((TruncLLVM) instruct).value);
            } else if (instruct instanceof XorLLVM) {
                cn.kill_set.add(((XorLLVM) instruct).result);
                cn.gen_set.add(((XorLLVM) instruct).op1);
                cn.gen_set.add(((XorLLVM) instruct).op2);
            } else if (instruct instanceof ZextLLVM) {
                cn.kill_set.add(((ZextLLVM) instruct).result);
                cn.gen_set.add(((ZextLLVM) instruct).value);
            }
        }
    }

    static private void computeLOSets(CfgNode cn) {
        for(CfgNode suc: cn.sucs) {
            cn.lo_set.addAll(suc.gen_set);

            for(ExprReturn kill: suc.kill_set) {
                if (suc.lo_set.contains(kill)) {
                    suc.lo_set.remove(kill);
                }
            }
        }
    }
}
