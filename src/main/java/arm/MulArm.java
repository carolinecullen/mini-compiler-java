package arm;

import llvm.ExprReturn;

public class MulArm {

    private ExprReturn result;
    private ExprReturn opr1;
    private ExprReturn opr2;

    public MulArm(ExprReturn res, ExprReturn operand1, ExprReturn operand2) {
        result = res;
        opr1 = operand1;
        opr2 = operand2;
    }

    public String toString() {
        return "mul " + result.toString() + ", " + opr1.toString() + ", " + opr2.toString();
    }
}
