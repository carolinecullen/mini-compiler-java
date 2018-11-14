package ast;

import java.util.HashMap;

public class DeleteStatement
   extends AbstractStatement
{
   public final Expression expression;

   public DeleteStatement(int lineNum, Expression expression)
   {
      super(lineNum);
      this.expression = expression;
   }

   public Type TypeCheck(HashMap<String, SymbolEntry> locals, Type ret_type) {
      Type e = expression.TypeCheck(locals, ret_type);
      if (e instanceof StructType) {
         return e;
      } else {
         System.err.println("Invalid delete at line " + lineNum + ": deletes must be structures");
         System.exit(1);
         return null;
      }
   }
}
