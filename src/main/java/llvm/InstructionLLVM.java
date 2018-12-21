package llvm;

import arm.MovtArm;
import arm.MovwArm;
import cfg.CfgNode;

import java.util.ArrayList;

public interface InstructionLLVM {

    String toString();
    Register getReturnVal();
    void replaceRet(Register r);
    ArrayList<String> getArm(CfgNode br_lbl);
    String getInstruction();
    void setInstruction(String instruction);

    default ExprReturn getImmediateMovInstructions(ImmediateLLVM oper, ArrayList<String> ret_str) {
        Register temp = new Register(new IntLLVM());
        MovwArm mw = new MovwArm(temp, "#lower16:" + oper.num);
        MovtArm mt= new MovtArm(temp, "#upper16:" +oper.num);
        ret_str.add(mw.toString());
        ret_str.add(mt.toString());
        return temp;
    }

}
