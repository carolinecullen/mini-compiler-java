package llvm;

import arm.AddArm;
import arm.AndArm;
import arm.MovtArm;
import arm.MovwArm;
import cfg.CfgNode;

import java.util.ArrayList;

public class AndLLVM
    implements InstructionLLVM
{

    public Register result;
    public String ty;
    public ExprReturn op1;
    public ExprReturn op2;
    String instruction;

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public AndLLVM(ExprReturn l, ExprReturn r) {
        BoolLLVM n = new BoolLLVM();
        ty = n.name;
        result = new Register(new BoolLLVM());
        op1 = l;
        op2 = r;
        instruction = this.toString();
    }

    public String getInstruction() {
        return instruction;
    }

    public String toString() {
        return result + " = and " + ty + " " + op1.toString() + ", " + op2.toString();
    }

    public ArrayList<String> getArm(CfgNode c) {
        ArrayList<String> ret_str = new ArrayList<>();
        if (op1 instanceof ImmediateLLVM && op2 instanceof ImmediateLLVM) {
            ExprReturn al1 = getImmediateMovInstructions((ImmediateLLVM)op1, ret_str);
            ExprReturn al2 = getImmediateMovInstructions((ImmediateLLVM)op2, ret_str);
            AndArm andarm = new AndArm(result, al1, al2);
            ret_str.add(andarm.toString());
        } else if (op1 instanceof ImmediateLLVM) {
            ExprReturn al1 = getImmediateMovInstructions((ImmediateLLVM)op1, ret_str);
            AndArm andarm = new AndArm(result, al1, op2);
            ret_str.add(andarm.toString());
        } else if (op2 instanceof ImmediateLLVM) {
            ExprReturn al1 = getImmediateMovInstructions((ImmediateLLVM)op2, ret_str);
            AndArm andarm = new AndArm(result, op1, al1);
            ret_str.add(andarm.toString());
        } else {
            AndArm andarm = new AndArm(result, op1, op2);
            ret_str.add(andarm.toString());
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
