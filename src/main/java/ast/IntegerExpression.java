package ast;

import llvm.ExprReturn;
import llvm.ImmediateLLVM;

import java.util.HashMap;

public class IntegerExpression
   extends AbstractExpression
{
   private final String value;

   public IntegerExpression(int lineNum, String value)
   {
      super(lineNum);
      this.value = value;
   }

   public Type TypeCheck(HashMap<String, SymbolEntry> locals, Type ret_type) {
      return new IntType();
   }

   public ExprReturn getLLVM(cfg.CfgNode c, ast.Function f) {
      return new ImmediateLLVM(Integer.parseInt(value));
   }
}
