package ast;

import java.util.HashMap;

public class ReturnEmptyStatement
   extends AbstractStatement
{
   public ReturnEmptyStatement(int lineNum)
   {
      super(lineNum);
   }

   public Type TypeCheck(HashMap<String, SymbolEntry> locals, Type ret_type) {
       if (ret_type instanceof VoidType) {
           return ret_type;
       } else {
           System.err.println("Invalid return on line " + lineNum + " return type is not void, expected void");
           System.exit(1);
           return null;
       }
   }

    public boolean returnCheck() { return true; }
}
