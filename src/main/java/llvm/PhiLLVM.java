package llvm;

import arm.MovArm;
import ast.SymbolEntry;
import ast.Type;
import cfg.CfgNode;
import mini.MiniCompiler;

import java.util.ArrayList;
import java.util.List;

public class PhiLLVM
        implements InstructionLLVM
{
    public List<Tuple<ExprReturn, String>> value_block_pairs = new ArrayList<>();
    public Register result;
    public String variable;
    public CfgNode blk;
    String instruction;
    public int phi_number;

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public PhiLLVM(CfgNode b, String v, TypeLLVM ty) {
//        result = new Register(new IdLLVM(v, ty, SymbolEntry.Scope.LOC));
//        System.out.println(ty.getName());
        phi_number = MiniCompiler.phi_counter++;
        result = new Register(ty);
//        result = new Register(ty);
        variable = v;
        blk = b;
        instruction = this.toString();
    }

    public String getInstruction() {
        return instruction;
    }

    public String toString () {
        String ret_str = result + " = phi " + result.reg_type.getName() + " ";
        int i = 1;
        for(Tuple<ExprReturn, String> pair: value_block_pairs) {
            if (i == value_block_pairs.size()) {
                ret_str += "[";
                ret_str += pair.name;
                ret_str += ", %";
                ret_str += pair.branch;
                ret_str += "]";
            } else {
                ret_str += "[";
                ret_str += pair.name;
                ret_str += ", %";
                ret_str += pair.branch;
                ret_str += "]";
                ret_str += ", ";
            }
            i++;
        }

        return ret_str;
    }

    public ArrayList<String> getArm(CfgNode c) {
        ArrayList<String> ret_str = new ArrayList<>();
        ret_str.add((new MovArm("%phi" + phi_number, result)).toString());
        return ret_str;
    }

    public void appendOperand(String name, String blk_label, ExprReturn rt) {
        value_block_pairs.add(new Tuple<>(rt, blk_label));
    }

    public void replaceRegForOpt(String func) {}


    public Register getReturnVal() {
        return result;
    }

    public void replaceRet(Register r) {
        result = r;
    }
}
