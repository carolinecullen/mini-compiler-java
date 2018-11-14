package ast;

import llvm.ExprReturn;
import llvm.NullLLVM;

import java.util.HashMap;

public class NullExpression
   extends AbstractExpression
{
   public NullExpression(int lineNum)
   {
      super(lineNum);
   }

   public Type TypeCheck(HashMap<String, SymbolEntry> locals, Type ret_type) {

      return new NullType();
   }

    public ExprReturn getLLVM(cfg.CfgNode c, ast.Function f) {
        return NullLLVM.getExprReturn();
    }

}
