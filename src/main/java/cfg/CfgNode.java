package cfg;

import llvm.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class CfgNode {

    public String label;
    public ArrayList<CfgNode> preds;
    public ArrayList<CfgNode> sucs;
    public boolean sealed = false;
    public ArrayList<llvm.InstructionLLVM> llvm_instructions;
    public ArrayList<llvm.InstructionLLVM> phis;
    public HashMap<String, TypeLLVM> curDef = new HashMap<>();

    public CfgNode (String l) {
        label = l;
        preds = new ArrayList<>();
        sucs = new ArrayList<>();
        llvm_instructions = new ArrayList<>();
    }


//    public void writeVariable(String var, TypeLLVM ty) {
//        curDef.put(var, ty);
//    }
//
//    private TypeLLVM readVariable(String var, TypeLLVM ty) {
//        if (curDef.containsKey(var)) {
//            return curDef.get(var);
//        } else {
//            return readVariabeFromPredecessors(var, ty);
//        }
//    }
//
//    private TypeLLVM readVariabeFromPredecessors(String name, TypeLLVM ty) {
//        if (!sealed) {
//            Register result = new Register(ty);
//            phis.add(new PhiLLVM(name, result));
//            writeVariable(name, result);
//            return result.reg_type;
//        } else if (preds.size() == 0) {
//            if (ty instanceof BoolLLVM || ty instanceof IntLLVM) {
//                writeVariable(name, new IntLLVM);
//                return new IntLLVM;
//            } else if (ty instanceof ) {
//                writeVariable(name, new NullLLVM);
//                return new NullLLVM;
//            } else {
//                throw new RuntimeException("Should not be here");
//            }
//        } else if (preds.size() == 1) {
//            TypeLLVM result = preds.get(0).readVariable(name, ty);
//            writeVariable(name, result);
//            return result;
//        } else {
//            Register result = new Register(ty);
//            PhiLLVM newphi = new PhiLLVM(name, result);
//            phis.add(newphi);
//            writeVariable(name, result.reg_type);
//            addPhiOperands(name, ty, newphi);
//            return result;
//        }
//    }
//
//    private void addPhiOperands(String var, TypeLLVM t, PhiLLVM phi) {
//        for (CfgNode pred : preds) {
////            llvm_instructions.add(pred.readVariable(var, t), pred.label);
//        }
//    }
}
