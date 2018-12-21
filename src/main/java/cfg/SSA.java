package cfg;

import llvm.ExprReturn;
import llvm.PhiLLVM;
import llvm.TypeLLVM;

public class SSA {

    public void writeVariable(CfgNode blk, String var, ExprReturn er) {
//        System.out.println(var);
        blk.curDef.put(var, er);
    }

    public ExprReturn readVariable(CfgNode blk, String var, TypeLLVM ty) {
        if (blk.curDef.containsKey(var)) {
//            System.out.println(var + " " + blk.curDef.get(var));
            return blk.curDef.get(var);
        } else {
            return readVariableFromPredecessors(blk, var, ty);
        }
    }

    private ExprReturn readVariableFromPredecessors(CfgNode blk, String name, TypeLLVM ty) {
        PhiLLVM val;
        if (!blk.sealed) {
            val = new PhiLLVM(blk, name, ty);
            blk.incomplete_phis.put(name, val);
        } else if (blk.preds.size() == 0) {
            System.err.println("Incorrect phi instruction in SSA: expected predecessors for previous declaration of " + name + " looking in " + blk.label);
            System.exit(1);
            return null;
        } else if (blk.preds.size() == 1) {
            return readVariable(blk.preds.get(0), name, ty);
        } else {
            val = new PhiLLVM(blk, name, ty);
//            System.out.println(name);
            writeVariable(blk, name, val.result);
            addOperands(blk, name, val);
        }
        writeVariable(blk, name, val.result);
        blk.phis.add(val);
        return val.result;
    }

    private void addOperands(CfgNode blk, String var, PhiLLVM phi) {
//        System.out.println(blk.label);
        for (CfgNode pred : blk.preds) {
//            System.out.println("\t" + pred.label);
            phi.appendOperand(var, pred.label, readVariable(pred, var, phi.result.reg_type));

        }
    }

    public void sealBlock(CfgNode blk) {
        //  get target variables of all incomplete phis in this block
        for (String phi: blk.incomplete_phis.keySet()) {
            PhiLLVM act_phi = (PhiLLVM)blk.incomplete_phis.get(phi);
            // for each variable, fill phi based on predecessors
            addOperands(blk, act_phi.variable, act_phi);
        }

        blk.sealed = true;
        cfg.Cfg.sealed_blocks.add(blk);
    }

    public void printCurDefForDebugging(CfgNode blk) {
        System.out.println("curdef values for: " + blk.label + "\n");
        for(String key: blk.curDef.keySet()) {
            ExprReturn expr = blk.curDef.get(key);
            System.out.println(key + ": " + expr.toString());
        }
        System.out.println("\n");
    }

}
