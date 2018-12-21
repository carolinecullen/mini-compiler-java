package llvm;

import arm.LdrArm;
import arm.MovArm;
import cfg.CfgNode;

import java.util.ArrayList;

public class LoadLLVM
    implements InstructionLLVM {

    public Register result;
    String ty;
    public Register ptr;
    String ty2;
    String instruction;

    public LoadLLVM (Register r, TypeLLVM t) {
        result = new Register(t);
        ty = t.getName() + "*";
        ty2 = t.getName();
        ptr = r;
        instruction = this.toString();
    }

    public LoadLLVM (Register r, TypeLLVM t, Register r1) {
        result = r1;
        ty = t.getName() + "*";
        ty2 = t.getName();
        ptr = r;
        instruction = this.toString();
    }

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public String getInstruction() {
        return instruction;
    }

    public String toString() {
        return result + " = load " + ty2 + ", " + ty + " " + ptr.reg_name;
    }

    public void replaceRegForOpt (String func) {
        ptr.reg_name = ptr.reg_name + func;
        result = new Register(result.reg_type);
    }

    public ArrayList<String> getArm(CfgNode c_node) {
        ArrayList<String> ret_str = new ArrayList<>();
        ret_str.add((new LdrArm(ptr, result)).toString());
        return ret_str;
    }

    public Register getReturnVal() {
        return result;
    }

    public void replaceRet(Register r) {
        result = r;
    }
}
