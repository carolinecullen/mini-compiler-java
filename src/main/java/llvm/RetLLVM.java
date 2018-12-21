package llvm;

import cfg.CfgNode;

import java.util.ArrayList;

public class RetLLVM
        implements InstructionLLVM
{
    String ty;
    public ExprReturn reg;
    String instruction;


    public RetLLVM(ExprReturn r) {
        if(r instanceof Register) {
            Register n_r = (Register)r;
            ty = n_r.reg_type.getName();
            reg = n_r;
        } else {
            ImmediateLLVM n_i = (ImmediateLLVM) r;
            ty = "i32";
            reg = n_i;
        }
        instruction = this.toString();
    }


    public RetLLVM(Register r) {
        ty = r.reg_type.getName();
        reg = r;
        instruction = this.toString();
    }

    public String getInstruction() {
        return instruction;
    }

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public String toString () {
        if(reg instanceof ImmediateLLVM) {
            return "ret " + ty + " " + ((ImmediateLLVM)reg).num;
        } else {
            return "ret " + ty + " " + ((Register)reg).reg_name;
        }
    }

    public ArrayList<String> getArm(CfgNode c_node) {
        ArrayList<String> ret_str = new ArrayList<>();

        if(reg instanceof ImmediateLLVM) {
            ret_str.add("mov r0, #" + ((ImmediateLLVM)reg).num);
        }else {
            ret_str.add("mov r0, " + ((Register)reg).reg_name);
        }
        ret_str.add("pop {fp, pc}");
        return ret_str;
    }

    public void replaceRegForOpt(String func) {}

    public Register getReturnVal() {
        return null;
    }

    public void replaceRet(Register r) {
    }
}