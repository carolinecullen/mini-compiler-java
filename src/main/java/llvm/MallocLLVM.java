package llvm;

import arm.BlArm;
import arm.MovwArm;
import cfg.CfgNode;

import java.util.ArrayList;

public class MallocLLVM
        implements InstructionLLVM {

    public Register result;
    public int size;
    String instruction;

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public MallocLLVM (int s) {
        result = new Register(new IEightLLVM());
        size = s;
        instruction = this.toString();
    }

    public String getInstruction() {
        return instruction;
    }

    public String toString() {
        return result + " = call i8* @malloc_helper(i32 " + size + ")";
    }

    public ArrayList<String> getArm(CfgNode c_node) {
        ArrayList<String> ret_str = new ArrayList<>();
        MovwArm mw = new MovwArm("r0", Integer.toString(size/2));
        ret_str.add(mw.toString());

        BlArm b = new BlArm("malloc_helper");
        ret_str.add(b.toString());

        ret_str.add("mov " + result + ", r0");
        return ret_str;
    }


    public Register getReturnVal() {
        return result;
    }

    public void replaceRet(Register r) {
        result = r;
    }

    public void replaceRegForOpt (String func) {}
}
