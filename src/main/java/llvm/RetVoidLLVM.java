package llvm;

import cfg.CfgNode;

import java.util.ArrayList;

public class RetVoidLLVM
    implements InstructionLLVM
{
    String instruction;

    public RetVoidLLVM () {
        instruction = this.toString();
    }

    public String getInstruction() {
        return instruction;
    }

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public String toString () {
        return "ret void";
    }

    public void replaceRegForOpt(String func) {}

    public ArrayList<String> getArm(CfgNode c_node) {
        ArrayList<String> ret_str = new ArrayList<>();
        ret_str.add("pop {fp, pc}");
        return ret_str;
    }

    public Register getReturnVal() {
        return null;
    }

    public void replaceRet(Register r) {
    }
}
