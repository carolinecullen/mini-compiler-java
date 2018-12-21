package ast;

import java.util.HashMap;

public class PrintStatement
   extends AbstractStatement
{
   public final Expression expression;

   public PrintStatement(int lineNum, Expression expression)
   {
      super(lineNum);
      this.expression = expression;
   }

   public Type TypeCheck(HashMap<String, SymbolEntry> locals, Type ret_type) {
       return expression.TypeCheck(locals, ret_type);
   }

   public boolean returnCheck() {
      return false;
   }
}
