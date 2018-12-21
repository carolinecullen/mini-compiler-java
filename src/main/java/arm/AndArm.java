package arm;

import llvm.ExprReturn;
import llvm.IntLLVM;
import llvm.Register;

public class AndArm {

    private ExprReturn result;
    private ExprReturn opr1;
    private ExprReturn opr2;

    public AndArm(ExprReturn res, ExprReturn operand1, ExprReturn operand2) {
        result = res;
        opr1 = operand1;
        opr2 = operand2;
    }

    public String toString() {
        return "and " + result.toString() + ", " + opr1.toString() + ", " + opr2.toString();
    }
}
