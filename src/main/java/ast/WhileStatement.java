package ast;

import java.util.HashMap;

public class WhileStatement
   extends AbstractStatement
{
   public final Expression guard;
   public final Statement body;

   public WhileStatement(int lineNum, Expression guard, Statement body)
   {
      super(lineNum);
      this.guard = guard;
      this.body = body;
   }

   public Type TypeCheck(HashMap<String, SymbolEntry> locals, Type ret_type) {
       if (guard.TypeCheck(locals, ret_type) instanceof BoolType) {
           return body.TypeCheck(locals, ret_type);
       } else {
           System.err.println("Invalid while statement guard at line " + lineNum + ": guard must be boolean");
           System.exit(1);
           return null;
       }
   }

    public boolean returnCheck() {
        return body.returnCheck();
    }

}
