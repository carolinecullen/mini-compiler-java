package arm;

import llvm.ExprReturn;
import llvm.ImmediateLLVM;
import llvm.Register;

public class MovgtArm
        implements InstructionArm
{
    private ExprReturn from;
    private Register into;
    private String ret_str;

    public MovgtArm(Register f, Register i) {
        from = f;
        into = i;
        ret_str = "movgt " + into.reg_name + ", " + ((Register)from).reg_name;
    }

    public MovgtArm(ImmediateLLVM f, Register i) {
        from = f;
        into = i;
        ret_str = "movgt " + into.reg_name + ", #" + ((ImmediateLLVM)from).num;
    }

    public String toString() {
        return ret_str;
    }

}
