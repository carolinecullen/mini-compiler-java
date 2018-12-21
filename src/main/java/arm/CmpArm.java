package arm;

import llvm.ExprReturn;
import llvm.ImmediateLLVM;
import llvm.IntLLVM;
import llvm.Register;

import java.util.ArrayList;

public class CmpArm
    implements InstructionArm
{

    private ExprReturn lcmp;
    private ExprReturn rcmp;
    private String ret_str;

    public CmpArm(ExprReturn f, ExprReturn i) {
        lcmp = f;
        rcmp = i;

        if(rcmp instanceof ImmediateLLVM && lcmp instanceof ImmediateLLVM) {
            ret_str = "cmp #" + ((ImmediateLLVM)lcmp).num + ", #" + ((ImmediateLLVM)rcmp).num;
        } else if (rcmp instanceof ImmediateLLVM) {
            ret_str = "cmp " + ((Register)lcmp).reg_name + ", #" + ((ImmediateLLVM)rcmp).num;
        } else if (lcmp instanceof ImmediateLLVM) {
            ret_str = "cmp #" + ((ImmediateLLVM)lcmp).num + ", " + ((Register)rcmp).reg_name;
        } else {
            ret_str = "cmp " + ((Register)lcmp).reg_name + ", " + ((Register)rcmp).reg_name;
        }

    }

    public String toString() {
        return ret_str;
    }
}
