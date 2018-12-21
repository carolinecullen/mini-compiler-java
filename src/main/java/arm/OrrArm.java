package arm;

import llvm.ExprReturn;

public class OrrArm {

    private ExprReturn result;
    private ExprReturn opr1;
    private ExprReturn opr2;

    public OrrArm(ExprReturn res, ExprReturn operand1, ExprReturn operand2) {
        result = res;
        opr1 = operand1;
        opr2 = operand2;
    }

    public String toString() {
        return "orr " + result.toString() + ", " + opr1.toString() + ", " + opr2.toString();
    }
}
