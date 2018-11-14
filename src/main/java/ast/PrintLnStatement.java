package ast;

import java.util.HashMap;

public class PrintLnStatement
   extends AbstractStatement
{
   public final Expression expression;

   public PrintLnStatement(int lineNum, Expression expression)
   {
      super(lineNum);
      this.expression = expression;
   }

   public Type TypeCheck(HashMap<String, SymbolEntry> locals, Type ret_type) {
      return expression.TypeCheck(locals, ret_type);
   }


}
