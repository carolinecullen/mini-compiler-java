package llvm;

import arm.BArm;
import arm.BeqArm;
import arm.CmpArm;
import cfg.CfgNode;

import java.util.ArrayList;

public class BrLLVM
    implements InstructionLLVM
{
    public ExprReturn reg;
    private String el_block;
    private String th_block;
    String instruction;

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public BrLLVM (ExprReturn r, String th, String el) {
        reg = r;
        th_block = th;
        el_block = el;
        instruction = this.toString();
    }

    public String getInstruction() {
        return instruction;
    }

    public ArrayList<String> getArm(CfgNode c_node) {
        ArrayList<String> ret_str = new ArrayList<>();

        if(reg instanceof ImmediateLLVM) {

        } else {
            CmpArm c = new CmpArm(((Register)reg), (new ImmediateLLVM(1)));
            ret_str.add(c.toString());

        }

        BeqArm beq = new BeqArm(th_block);
        ret_str.add(beq.toString());

        BArm b = new BArm(el_block);
        ret_str.add(b.toString());

        return ret_str;
    }

    public String toString() {
        if(reg instanceof Register) {
            return "br i1 " + ((Register) reg).reg_name + ", label %" + th_block + ", label %" + el_block;
        } else {
            return "br i1 " + ((ImmediateLLVM) reg).num + ", label %" + th_block + ", label %" + el_block;
        }
    }

    public void replaceRegForOpt(String func_name) {}

    public Register getReturnVal() {
        return null;
    }

    public void replaceRet(Register r) {}


}
