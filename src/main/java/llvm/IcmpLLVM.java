package llvm;


import arm.*;
import cfg.CfgNode;

import java.util.ArrayList;

public class IcmpLLVM
        implements InstructionLLVM {

    public Register result;
    public String ty;
    public String cond;
    public ExprReturn op1;
    public ExprReturn op2;
    String instruction;

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }


    public IcmpLLVM(String cond_type, ExprReturn l, ExprReturn r) {
        if (l instanceof Register) {
            Register l_reg = (Register)l;
            ty = l_reg.reg_type.getName();
        } else {
            ty = "i32";
        }
        cond = cond_type;
        result = new Register(new IOneLLVM());
        op1 = l;
        op2 = r;
        instruction = this.toString();
    }

    public String getInstruction() {
        return instruction;
    }

    public String toString() {
        return result + " = icmp " + cond + " " + ty + " " + op1 + ", " + op2;
    }


    public ArrayList<String> getArm(CfgNode c_node) {
        ArrayList<String> ret_str = new ArrayList<>();

        MovArm m = new MovArm(new ImmediateLLVM(0), result);
        CmpArm c = new CmpArm(op1, op2);
        ret_str.add(m.toString());
        ret_str.add(c.toString());

        if (cond.equals("sgt")) {
            MovgtArm mgt = new MovgtArm(new ImmediateLLVM(1), result);
            ret_str.add(mgt.toString());
        } else if (cond.equals("sle")) {
            MovleArm mgt = new MovleArm(new ImmediateLLVM(1), result);
            ret_str.add(mgt.toString());
        } else if (cond.equals("slt")) {
            MovltArm mgt = new MovltArm(new ImmediateLLVM(1), result);
            ret_str.add(mgt.toString());
        } else if (cond.equals("sge")) {
            MovgeArm mgt = new MovgeArm(new ImmediateLLVM(1), result);
            ret_str.add(mgt.toString());
        } else if (cond.equals("eq")) {
            MoveqArm mgt = new MoveqArm(new ImmediateLLVM(1), result);
            ret_str.add(mgt.toString());
        } else if (cond.equals("ne")) {
            MovneArm mgt = new MovneArm(new ImmediateLLVM(1), result);
            ret_str.add(mgt.toString());
        }

        return ret_str;
    }


    public void replaceRegForOpt(String func) {
        checkAndReplace(op1, func);
        checkAndReplace(op2, func);
    }

    private void checkAndReplace(ExprReturn op, String func) {
        if(op instanceof Register) {
            Register new_op = (Register)op;

            if(new_op.reg_type instanceof IdLLVM) {
                ((Register) op).reg_name = ((Register) op).reg_name + func;
            }
        }
    }

    public Register getReturnVal() {
        return result;
    }

    public void replaceRet(Register r) {
        result = r;
    }

}
