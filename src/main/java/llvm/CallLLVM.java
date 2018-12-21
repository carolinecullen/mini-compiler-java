package llvm;

import arm.BlArm;
import arm.MovArm;
import arm.MovwArm;
import ast.Declaration;
import cfg.CfgNode;

import java.util.ArrayList;
import java.util.List;

public class CallLLVM
        implements InstructionLLVM {

    String ty;
    public String fnptrval;
    public Register result = null;
    public ArrayList<ExprReturn> fnargs;
    private List<Declaration> args_decls;
    String instruction;

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }


    public CallLLVM(String name, ArrayList<ExprReturn> l, TypeLLVM ret, List<Declaration> ad) {
        ty = ret.getName();
        fnptrval = name;
        if(!ret.getName().equals("void")) {
            result = new Register(ret);
        }
        args_decls = ad;
        fnargs = l;
        instruction = this.toString();
    }

    public String getInstruction() {
        return instruction;
    }

    public String toString () {
        String ret_string = "";
        if(!ty.equals("void")) {
            ret_string += result;
            ret_string += " = ";
        }

        ret_string += "call ";
        ret_string += ty;
        ret_string += " @";
        ret_string += fnptrval;
        ret_string += "(";

        int i = 1;
        int j = 0;
        for(ExprReturn s: fnargs) {

            if (s instanceof Register) {
                Register c_cast = (Register)s;
                if (c_cast.reg_type instanceof NullLLVM) {
                    ret_string += getParamTypeFromOG(j);
                    ret_string += " ";
                    ret_string += c_cast.reg_name;
                } else {
                    ret_string += c_cast.toParamString();
                }
            } else {
                ImmediateLLVM c_cast = (ImmediateLLVM) s;
                ret_string += "i32 ";
                ret_string += c_cast.num;
            }
//            ret_string += s;

            if(i == fnargs.size()) {
                break;
            } else {
                ret_string += ", ";
            }
            i++;
            j++;
        }

        ret_string += ")";
        return ret_string;
    }

    public ArrayList<String> getArm(CfgNode c_node) {
        ArrayList<String> ret_str = new ArrayList<>();

        int reg_count = 0;

        for(ExprReturn s: fnargs) {
            if(!(s == null)){
                MovArm mw = new MovArm(s, "r" + Integer.toString(reg_count));
                ret_str.add(mw.toString());
            }

        }

        BlArm b = new BlArm(fnptrval);
        ret_str.add(b.toString());

        if(result != null) {
            MovArm mf = new MovArm("r0", result);
            ret_str.add(mf.toString());
        }

//        MovArm m = new MovArm("r0", result);
//        ret_str.add(m.toString());

        return ret_str;
    }


    private String getParamTypeFromOG (int pos) {

        int i = 0;
        for (Declaration decl: args_decls) {
            if(i == pos) {
                return decl.type.getLLVMType().getName();
            }
            i++;
        }
        return null;
    }

    public void replaceRegForOpt(String func_name) {}

    public Register getReturnVal() {
        return result;
    }

    public void replaceRet(Register r) {
        result = r;
    }
}
