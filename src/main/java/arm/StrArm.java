package arm;

import llvm.ExprReturn;

public class StrArm {

    private String opr1;
    private String opr2;

    public StrArm(String operand1, String operand2) {
        opr1 = operand1;
        opr2 = operand2;
    }

    public String toString() {
        return "str " + opr1 + ", [" + opr2 + "]";
    }
}
