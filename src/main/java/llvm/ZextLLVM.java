package llvm;

import arm.MovArm;
import cfg.CfgNode;

import java.util.ArrayList;

public class ZextLLVM
        implements InstructionLLVM
{
    public Register value;
    public Register result;
    String instruction;

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public ZextLLVM (Register n) {
        result = new Register(new BoolLLVM());
        value = n;
        instruction = this.toString();
    }

    public String getInstruction() {
        return instruction;
    }

    public ArrayList<String> getArm(CfgNode c_node) {
        ArrayList<String> ret_str = new ArrayList<>();
        ret_str.add((new MovArm(value, result)).toString());
        return ret_str;
    }
    //just do a move
    public String toString() {
        return result + " = zext i1 " + value.reg_name + " to i32";
    }

    public void replaceRegForOpt(String func) {}

    public Register getReturnVal() {
        return result;
    }

    public void replaceRet(Register r) {
        result = r;
    }
}
