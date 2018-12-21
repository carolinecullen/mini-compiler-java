package llvm;

import arm.MovArm;
import cfg.CfgNode;

import java.util.ArrayList;

public class TruncLLVM
    implements InstructionLLVM
{
//    String ty_from;
    public Register value;
    public Register result;
    String instruction;

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public TruncLLVM (Register r) {
        result = new Register(new IOneLLVM());
//        ty_from = ty;
        value = r;
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

    public String toString() {
        return result + " = trunc " + value.reg_type.getName() + " " + value.reg_name + " to i1";
    }

    public void replaceRegForOpt(String func) {}

    public Register getReturnVal() {
        return result;
    }

    public void replaceRet(Register r) {
        result = r;
    }

}
