package arm;

import llvm.ExprReturn;
import llvm.ImmediateLLVM;
import llvm.Register;

public class MovneArm {

    private ExprReturn from;
    private Register into;
    private String ret_str;

    public MovneArm(Register f, Register i) {
        from = f;
        into = i;
        ret_str = "movne " + into.reg_name + ", " + ((Register)from).reg_name;
    }

    public MovneArm(ImmediateLLVM f, Register i) {
        from = f;
        into = i;
        ret_str = "movne " + into.reg_name + ", #" + ((ImmediateLLVM)from).num;
    }

    public String toString() {
        return ret_str;
    }
}
