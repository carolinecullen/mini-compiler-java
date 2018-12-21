package llvm;


import arm.AddArm;
import cfg.CfgNode;

import java.util.ArrayList;

public class GetPtrLLVM
    implements InstructionLLVM {

    public Register result;
    String ty;
    public Register ptrval;
    String ty2;
    IOneLLVM eye_one = new IOneLLVM();
    int index;
    String instruction;

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public GetPtrLLVM(Register r, StructPtrLLVM n, TypeLLVM t, int i) {
        result = new Register(t);
        ty = n.getName();
        ty2 = n.getName().substring(0, n.getName().length()-1);
        ptrval = r;
        index = i;
        instruction = this.toString();
    }

    public String getInstruction() {
        return instruction;
    }

    public ArrayList<String> getArm(CfgNode c_node) {
        ArrayList<String> ret_str = new ArrayList<>();

        if(index != 0) {
            AddArm a = new AddArm(result, ptrval, new ImmediateLLVM(index*4));
            ret_str.add(a.toString());
        }

        return ret_str;
    }

    public String toString() {
        return result.reg_name + " = getelementptr "+ ty2 +", " + ty + " " + ptrval.reg_name + ", " + eye_one.name + " 0, i32 " + index;
    }

    public void replaceRegForOpt(String func_name) {}

    public Register getReturnVal() {
        return result;
    }

    public void replaceRet(Register r) {
        result = r;
    }
}
