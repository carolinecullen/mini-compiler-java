package arm;

import llvm.ExprReturn;
import llvm.ImmediateLLVM;

public class AddArm {

    private ExprReturn result;
    private ExprReturn opr1;
    private ExprReturn opr2;

    public AddArm(ExprReturn res, ExprReturn operand1, ExprReturn operand2) {
        result = res;
        opr1 = operand1;
        opr2 = operand2;
    }

    public AddArm(ExprReturn res, ExprReturn operand1, ImmediateLLVM operand2) {
        result = res;
        opr1 = operand1;
        opr2 = operand2;
    }

    public String toString() {
        if(opr2 instanceof ImmediateLLVM) {
            return "add " + result.toString() + ", " + opr1.toString() + ", #" + opr2.toString();
        } else {
            return "add " + result.toString() + ", " + opr1.toString() + ", " + opr2.toString();
        }

    }
}
