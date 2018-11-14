package ast;

import java.util.HashMap;

public class ReturnStatement
   extends AbstractStatement
{
   public final Expression expression;

   public ReturnStatement(int lineNum, Expression expression)
   {
      super(lineNum);
      this.expression = expression;
   }

   public Type TypeCheck(HashMap<String, SymbolEntry> locals, Type ret_type)
   {
       Type ret_val = expression.TypeCheck(locals, ret_type);
       if (ret_type.getClass().equals(ret_val.getClass())) {
           return ret_type;
       } else if (ret_type instanceof StructType && ret_val instanceof NullType) {
           return ret_type;
       } else {
           System.err.println("Invalid return on line " + lineNum + " return type does not match what is expected");
           System.exit(1);
           return null;
       }
   }

}
