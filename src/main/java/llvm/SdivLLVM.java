package llvm;

import arm.BlArm;
import arm.MovArm;
import cfg.CfgNode;

import java.util.ArrayList;

public class SdivLLVM
        implements InstructionLLVM {

    public Register result;
    public String ty;
    public ExprReturn op1;
    public ExprReturn op2;
    String instruction;

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public SdivLLVM(ExprReturn l, ExprReturn r) {
        ty = "i32";
        if(l instanceof Register) {
            result = new Register(((Register) l).reg_type);
        } else {
            result = new Register(new IntLLVM());
        }
        op1 = l;
        op2 = r;
        instruction = this.toString();
    }

    public String getInstruction() {
        return instruction;
    }

    public String toString() {
        return result + " = sdiv " + ty + " " + op1.toString() + ", " + op2.toString();
    }

    public ArrayList<String> getArm(CfgNode c_node) {
        ArrayList<String> ret_str = new ArrayList<>();

        MovArm m1 = new MovArm(op1, "r0");
        MovArm m2 = new MovArm(op2, "r1");
        ret_str.add(m1.toString());
        ret_str.add(m2.toString());

        BlArm bl = new BlArm("__aeabi_idiv");
        ret_str.add(bl.toString());

        MovArm mf = new MovArm("r0", result);
        ret_str.add(mf.toString());

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
        return null;
    }

    public void replaceRet(Register r) {
    }
}
