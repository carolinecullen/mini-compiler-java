package arm;

import llvm.ExprReturn;
import llvm.ImmediateLLVM;
import llvm.Register;

public class MovltArm {

    private ExprReturn from;
    private Register into;
    private String ret_str;

    public MovltArm(Register f, Register i) {
        from = f;
        into = i;
        ret_str = "movlt " + into.reg_name + ", " + ((Register)from).reg_name;
    }

    public MovltArm(ImmediateLLVM f, Register i) {
        from = f;
        into = i;
        ret_str = "movlt " + into.reg_name + ", #" + ((ImmediateLLVM)from).num;
    }

    public String toString() {
        return ret_str;
    }
}
