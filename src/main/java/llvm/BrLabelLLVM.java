package llvm;

import arm.BArm;
import arm.MovArm;
import cfg.CfgNode;

import java.util.ArrayList;
import java.util.HashMap;

public class BrLabelLLVM
        implements InstructionLLVM
{
    private String label;
    String instruction;

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public BrLabelLLVM (String l) {
        label = l;
        instruction = this.toString();
    }

    public String getInstruction() {
        return instruction;
    }

    public ArrayList<String> getArm(CfgNode branch) {
        ArrayList<String> ret_str = new ArrayList<>();

        for(ExprReturn expr: branch.phi_values_out_of_block.keySet()) {
            MovArm mv = new MovArm(expr, "%phi" + Integer.toString(branch.phi_values_out_of_block.get(expr)));
            ret_str.add(mv.toString());
        }

        BArm b = new BArm(label);
        ret_str.add(b.toString());

        return ret_str;
    }

    public String toString() {
        return "br label %" + label;
    }

    public Register getReturnVal() {
        return null;
    }

    public void replaceRet(Register r) {}

    public void replaceRegForOpt(String func_name) {}
}
