package ast;

import llvm.ExprReturn;
import llvm.ImmediateLLVM;

import java.util.HashMap;

public class TrueExpression
   extends AbstractExpression
{
   public TrueExpression(int lineNum)
   {
      super(lineNum);
   }

   public Type TypeCheck(HashMap<String, SymbolEntry> locals, Type ret_type) {
      return new BoolType();
   }

   public ExprReturn getLLVM(cfg.CfgNode c, ast.Function f) {
      return new ImmediateLLVM(1);
   }
}
