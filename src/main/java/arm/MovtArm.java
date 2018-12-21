package arm;

import llvm.ExprReturn;
import llvm.IntLLVM;
import llvm.Register;

public class MovtArm {

    private ExprReturn reg;
    private String val_to_move;
    public MovtArm(Register r, String num) {
        reg = r;
        val_to_move = num;
    }

    public String toString() {
        return "movt " + reg + ", " + val_to_move;
    }
}
