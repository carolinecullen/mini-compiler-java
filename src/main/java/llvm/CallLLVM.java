package llvm;

import ast.Declaration;

import java.util.ArrayList;
import java.util.List;

public class CallLLVM
        implements InstructionLLVM {
    String ty;
    String fnptrval;
    public Register result = null;
    ArrayList<ExprReturn> fnargs = new ArrayList<>();
    List<Declaration> args_decls;

    public CallLLVM(String name, ArrayList<ExprReturn> l, TypeLLVM ret, List<Declaration> ad) {
        ty = ret.getName();
        fnptrval = name;

        if(!ret.getName().equals("void")) {
            result = new Register(ret);
        }

        args_decls = ad;
        fnargs = l;
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

}
