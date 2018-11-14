package ast;

import java.util.HashMap;

public class LvalueId
   implements Lvalue
{
   private final int lineNum;
   public final String id;

   public LvalueId(int lineNum, String id)
   {
      this.lineNum = lineNum;
      this.id = id;
   }

   public Type TypeCheck(HashMap<String, SymbolEntry> locals, Type ret_type) {
       if (Program.glob_symbol_table.containsKey(id))
       {
           SymbolEntry cur =  Program.glob_symbol_table.get(id);

           if (cur.type instanceof FunctionType) {
               return ((FunctionType) cur.type).return_type;
           } else {
               return cur.type;
           }
       } else if (locals.containsKey(id)) {
           SymbolEntry cur =  locals.get(id);
           return cur.type;
       } else {
           System.err.println("Invalid identifier on line " + lineNum + ": id " + id + " is not declared for current scope");
           System.exit(1);
           return null;
       }
   }
}
