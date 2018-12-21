package llvm;

import cfg.CfgNode;

import java.util.ArrayList;

public class ReadLLVM
    implements InstructionLLVM {

    public Register result;
    String instruction;

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public ReadLLVM () {
        result = new Register(new IntLLVM());
        instruction = this.toString();
    }

    public String getInstruction() {
        return instruction;
    }

    public String toString() {
        return result + " = call i32 @read_helper()";
    }

    public ArrayList<String> getArm(CfgNode c_node) {
        ArrayList<String> ret_str = new ArrayList<>();
        ret_str.add("bl read_helper");
        ret_str.add("mov " + result + ", r0");
        return ret_str;
    }

    public void replaceRegForOpt(String func) {}

    public Register getReturnVal() {
        return result;
    }

    public void replaceRet(Register r) {
        result = r;
    }

}
