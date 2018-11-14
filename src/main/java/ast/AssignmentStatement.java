package ast;

import java.util.HashMap;

public class AssignmentStatement
   extends AbstractStatement
{
   public final Lvalue target;
   public final Expression source;

   public AssignmentStatement(int lineNum, Lvalue target, Expression source)
   {
      super(lineNum);
      this.target = target;
      this.source = source;
   }

   public Type TypeCheck(HashMap<String, SymbolEntry> locals, Type return_type) {
      Type targ = target.TypeCheck(locals, return_type);
      Type sour = target.TypeCheck(locals, return_type);
      if (targ.getClass().equals(sour.getClass())) {
         return target.TypeCheck(locals, return_type);
      } else if (sour.getClass().equals(new NullType())) {
         return target.TypeCheck(locals, return_type);
      } else {
         System.err.println("Invalid assignment on line " + lineNum + ": types must match for assignment to be valid");
         System.exit(1);
         return null;
      }
   }
}
