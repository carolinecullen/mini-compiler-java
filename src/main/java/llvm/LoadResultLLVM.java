package llvm;

import arm.LdrArm;
import cfg.CfgNode;

import java.util.ArrayList;

public class LoadResultLLVM
        implements InstructionLLVM {

    public Register result;
    String ty;
    String ty2;
    String instruction;
    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }


    public LoadResultLLVM (TypeLLVM t) {
        result = new Register(t);
        ty = t.getName() + "*";
        ty2 = t.getName();
        instruction = this.toString();
    }

    public String getInstruction() {
        return instruction;
    }

    public String toString() {
        return result + " = load " + ty2 + ", " + ty + " %_retval_";
    }

    public void replaceRegForOpt (String func) {}

    public ArrayList<String> getArm(CfgNode c_node) {
        ArrayList<String> ret_str = new ArrayList<>();
        ret_str.add((new LdrArm("%_retval_", result)).toString());
        return ret_str;
    }

    public Register getReturnVal() {
        return result;
    }

    public void replaceRet(Register r) {
        result = r;
    }

}
