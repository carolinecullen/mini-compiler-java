package llvm;

import arm.MovArm;
import cfg.CfgNode;

import java.util.ArrayList;

public class PrintfLLVM
    implements InstructionLLVM
{
    public ExprReturn reg;
    String ty;
    String instruction;

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public PrintfLLVM (ExprReturn r) {
        reg = r;
        ty = "i32";
        instruction = this.toString();
    }

    public String getInstruction() {
        return instruction;
    }

    public String toString() {
        if (reg instanceof Register) {
            return "call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), " + ty + " " + ((Register)reg).reg_name + ")";
        } else {
            return "call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), " + ty + " " + ((ImmediateLLVM)reg).num + ")";
        }
    }

    public ArrayList<String> getArm(CfgNode c_node) {
        ArrayList<String> ret_str = new ArrayList<>();
//        MovArm mv1 = new MovArm("r0", (Register)reg);
        MovArm mv2 = new MovArm(reg, "r1");
//        ret_str.add(mv1.toString());
        ret_str.add(mv2.toString());
        ret_str.add("movw r0, #:lower16:.PRINT_FMT\n\tmovt r0, #:upper16:.PRINT_FMT\n\tbl printf");
        return ret_str;
   }


    public Register getReturnVal() {
        return null;
    }

    public void replaceRet(Register r) {
    }
    public void replaceRegForOpt(String func) {}

}
