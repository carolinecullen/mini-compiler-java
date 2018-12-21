package cfg;

import ast.ReturnStatement;
import llvm.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class CfgNode {

    public String label;
    public ArrayList<CfgNode> preds;
    public ArrayList<CfgNode> sucs;
    public boolean sealed = false;
    public ArrayList<llvm.InstructionLLVM> llvm_instructions;
    public HashMap<String, llvm.InstructionLLVM> incomplete_phis = new HashMap<>();
    public ArrayList<llvm.InstructionLLVM> phis = new ArrayList<>();
    public HashMap<ExprReturn, Integer> phi_values_out_of_block = new HashMap<>();
    public HashMap<String, ExprReturn> curDef = new HashMap<>();
    public ArrayList<ExprReturn> gen_set = new ArrayList<>();
    public ArrayList<ExprReturn> kill_set = new ArrayList<>();
    public ArrayList<ExprReturn> lo_set = new ArrayList<>();

    public CfgNode (String l) {
        label = l;
        preds = new ArrayList<>();
        sucs = new ArrayList<>();
        llvm_instructions = new ArrayList<>();
    }

}
