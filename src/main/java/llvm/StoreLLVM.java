package llvm;

import arm.MovtArm;
import arm.MovwArm;
import arm.StrArm;
import cfg.CfgNode;
import cfg.OptimizeCFG;

import java.util.ArrayList;

public class StoreLLVM
    implements InstructionLLVM
{
    public TypeLLVM l_ty;
    public String l;
    public TypeLLVM r_ty;
    public String r;
    public String instruction;

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public StoreLLVM(TypeLLVM l_type, String lv, TypeLLVM r_type, String rv) {
        l_ty = l_type;
        r_ty = r_type;
        l = lv;
        r = rv;
        instruction = this.toString();

    }

    public String getInstruction() {
        return instruction;
    }

    public ArrayList<String> getArm(CfgNode c) {
        ArrayList<String> ret_str = new ArrayList<>();

        if(l_ty instanceof IntLLVM) {
            Register tmp = new Register(new IntLLVM());
            MovtArm mt = new MovtArm(tmp, "#" +l);
            MovwArm mw = new MovwArm(tmp, "#" +l);
            ret_str.add(mt.toString());
            ret_str.add(mw.toString());
            StrArm store = new StrArm(tmp.toString(), r);
            ret_str.add(store.toString());
            return ret_str;
        } else if (l_ty instanceof IntLLVM) {
            Register tmp = new Register(new IntLLVM());
            MovtArm mt = new MovtArm(tmp, "#" +r);
            MovwArm mw = new MovwArm(tmp, "#" +r);
            ret_str.add(mt.toString());
            ret_str.add(mw.toString());
            StrArm store = new StrArm(r, tmp.toString());
            ret_str.add(store.toString());
            return ret_str;
        }
        StrArm store = new StrArm(l, r);
        ret_str.add(store.toString());
        return ret_str;
    }

    public String toString() {
        return "store " + l_ty.getName() + " " + l + ", " + r_ty.getName() + "* " + r;
    }

    public void replaceRegForOpt(String func) {
        // doesnt work need the types of the registers
        if(l.charAt(1) == '_') {
            l = l + func;
        }

        if(r.charAt(1) == '_') {
            r = r + func;
        }
    }

    public Register getReturnVal() {
        return null;
    }

    public void replaceRet(Register r) {}

}
