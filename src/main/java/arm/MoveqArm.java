package arm;

import llvm.ExprReturn;
import llvm.ImmediateLLVM;
import llvm.Register;

public class MoveqArm {

    private ExprReturn from;
    private Register into;
    private String ret_str;

    public MoveqArm(Register f, Register i) {
        from = f;
        into = i;
        ret_str = "moveq " + into.reg_name + ", " + ((Register)from).reg_name;
    }

    public MoveqArm(ImmediateLLVM f, Register i) {
        from = f;
        into = i;
        ret_str = "moveq " + into.reg_name + ", #" + ((ImmediateLLVM)from).num;
    }

    public String toString() {
        return ret_str;
    }
}
