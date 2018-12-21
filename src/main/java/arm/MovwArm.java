package arm;

import llvm.ExprReturn;
import llvm.IntLLVM;
import llvm.Register;

public class MovwArm {

    private ExprReturn reg;
    private String val_to_move;
    private String ret_string;

    public MovwArm(Register r, String num) {
        reg = r;
        val_to_move = num;
        ret_string = "movw " + reg + ", " + val_to_move;
    }

    public MovwArm(String r, String num) {
        reg = null;
        val_to_move = num;
        ret_string = "movw " + r + ", #" + val_to_move;
    }

    public String toString() {
        return ret_string;
    }
}
