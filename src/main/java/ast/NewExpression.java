package ast;

import llvm.*;
import mini.MiniCompiler;

import java.util.HashMap;

import static cfg.Cfg.ssa;
import static mini.MiniCompiler.user_spec;

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
           return new StructType(lineNum, id);
       } else {
           System.err.println("Invalid new expression: " + id + " is not a declared struct");
           System.exit(1);
           return null;
       }
   }

    public ExprReturn getLLVM(cfg.CfgNode c, ast.Function f) {
        if (Program.struct_table.containsKey(id)) {
            HashMap<String, StructField> hld1 = Program.struct_table.get(id);
            MallocLLVM malloc = new MallocLLVM(hld1.size() * 8);
            BitcastLLVM btcst = new BitcastLLVM(malloc.result, new StructPtrLLVM(id));
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
