package ast;

import llvm.*;

import java.util.HashMap;

public class NewExpression
   extends AbstractExpression
{
   private final String id;

   public NewExpression(int lineNum, String id)
   {
      super(lineNum);
      this.id = id;
   }

   public Type TypeCheck(HashMap<String, SymbolEntry> locals, Type ret_type) {

       if (Program.struct_table.containsKey(id)) {
           return Program.glob_symbol_table.get(id).type;
       } else {
           System.err.println("Invalid new expression: " + id + " is not a declared struct");
           System.exit(1);
           return null;
       }
   }

    public ExprReturn getLLVM(cfg.CfgNode c, ast.Function f) {
//        ArrayList<ExprReturn> hld = new ArrayList<>();
        HashMap<String, StructField> hld1 = Program.struct_table.get(id);
//        IntLLVM i = new IntLLVM();
//        hld.add(new ImmediateLLVM(i, hld1.size() * 8));
//        CallLLVM malloc = new CallLLVM("@malloc", hld, new IEightLLVM());
        MallocLLVM malloc = new MallocLLVM(hld1.size() * 8);
        BitcastLLVM btcst;
        if (Program.struct_table.containsKey(id)) {
            Type ty =  new StructType(0, id);
            TypeLLVM tyllvm = ty.getLLVMType();
            btcst = new BitcastLLVM(malloc.result, tyllvm);
            c.llvm_instructions.add(malloc);
            c.llvm_instructions.add(btcst);
            return btcst.result;
        } else {
            System.err.println("Invalid new expression: " + id + " is not a declared struct");
            System.exit(1);
            return null;
        }


    }
}
