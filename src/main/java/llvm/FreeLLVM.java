package llvm;

import arm.BlArm;
import arm.MovArm;
import cfg.CfgNode;

import java.util.ArrayList;

public class FreeLLVM
    implements InstructionLLVM
{
    public Register reg;
    String instruction;

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public FreeLLVM (Register r) {
        reg = r;
        instruction = this.toString();
    }

    public String getInstruction() {
        return instruction;
    }

    public String toString() {
       return "call void @free(i8* " + reg.reg_name + ")";
    }

    public ArrayList<String> getArm(CfgNode c_node) {
        ArrayList<String> ret_str = new ArrayList<>();
        MovArm mw = new MovArm(reg, "r0");
        ret_str.add(mw.toString());

        BlArm b = new BlArm("free");
        ret_str.add(b.toString());
        return ret_str;
    }

    public void replaceRegForOpt(String func_name) {}

    public Register getReturnVal() {
        return null;
    }

    public void replaceRet(Register r) {}

}
