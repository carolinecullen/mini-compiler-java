package arm;

import llvm.ExprReturn;
import llvm.ImmediateLLVM;
import llvm.Register;

public class MovArm
    implements InstructionArm
{
    private ExprReturn from;
    private ExprReturn into;
    private String ret_str;

    public MovArm(ExprReturn f, ExprReturn i) {
        from = f;
        into = i;

        if(into instanceof ImmediateLLVM && from instanceof ImmediateLLVM) {
            ret_str = "mov #" + ((ImmediateLLVM)into).num + ", #" + ((ImmediateLLVM)from).num;
        } else if (into instanceof ImmediateLLVM) {
            ret_str = "mov #" + ((ImmediateLLVM)into).num + ", " + ((Register)from).reg_name;
        } else if (from instanceof ImmediateLLVM) {
            ret_str = "mov " + ((Register)into).reg_name + ", #" + ((ImmediateLLVM)from).num;
        } else {
            ret_str = "mov " + ((Register)into).reg_name + ", " + ((Register)from).reg_name;
        }

    }

    public MovArm(ExprReturn f, String i) {
        from = f;

        if(from instanceof ImmediateLLVM) {
            ret_str = "mov " + i + ", #" + ((ImmediateLLVM)from).num;
        } else {
            ret_str = "mov " + i + ", " + ((Register)from).reg_name;
        }

    }

    public MovArm(String f, ExprReturn i) {
        into = i;

        if(into instanceof ImmediateLLVM ) {
            System.err.println("Cannot assign to a number value");
            System.exit(0);
        } else {

            if(!(into == null)){
                ret_str = "mov " + ((Register)into).reg_name + ", " + f;
            }

        }

    }

    public String toString() {
        return ret_str;
    }
}
