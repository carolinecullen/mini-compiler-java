package llvm;

import arm.AndArm;
import arm.MovArm;
import cfg.CfgNode;

import java.util.ArrayList;

public class BitcastLLVM
    implements InstructionLLVM
{

    public Register from;
    private String to;
    private String ft;
    public Register result;
    String instruction;

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public BitcastLLVM (Register r, TypeLLVM t) {
        result = new Register(t);
        from = r;
        ft = r.reg_type.getName();
        to = t.getName();
        instruction = this.toString();
    }

    public String getInstruction() {
        return instruction;
    }

    public String toString() {
        return result + " = bitcast " + ft + " " + from.reg_name + " to " + to;
    }

    public void replaceRegForOpt(String func_name) {}

    public ArrayList<String> getArm(CfgNode c) {
        ArrayList<String> ret_str = new ArrayList<>();
        ret_str.add((new MovArm(from, result)).toString());
        return ret_str;
    }

    public Register getReturnVal() {
        return result;
    }

    public void replaceRet(Register r) {
        result = r;
    }
}
