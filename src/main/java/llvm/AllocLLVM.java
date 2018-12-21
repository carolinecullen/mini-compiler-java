package llvm;

import arm.BlArm;
import arm.MovwArm;
import ast.SymbolEntry;
import cfg.CfgNode;

import java.util.ArrayList;

public class AllocLLVM
    implements InstructionLLVM
{

    public Register result;
    String ty;
    String instruction;

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public AllocLLVM(TypeLLVM t, String n, SymbolEntry.Scope sc) {
        if(sc == SymbolEntry.Scope.PARAM) {
            n = n.substring(1);
        }
        result = new Register(new IdLLVM(n, t, sc));
        ty = t.getName();
        instruction = this.toString();
    }

    public String getInstruction() {
        return instruction;
    }

    public ArrayList<String> getArm(CfgNode c) {
        ArrayList<String> ret_str = new ArrayList<>();
        return ret_str;
    }

    public String toString () {
        return result + " = alloca " + ty;
    }

    public void replaceRegForOpt (String func) {
        result.reg_name = result.reg_name + func;
    }

    public Register getReturnVal() {
        return result;
    }

    public void replaceRet(Register r) {
        result = r;
    }
}
