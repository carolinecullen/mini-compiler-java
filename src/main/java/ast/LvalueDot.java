package ast;

import java.util.HashMap;

public class LvalueDot
   implements Lvalue
{
   private final int lineNum;
   public final Expression left;
   public final String id;
   public String struct_name;

   public LvalueDot(int lineNum, Expression left, String id)
   {
      this.lineNum = lineNum;
      this.left = left;
      this.id = id;
      struct_name = null;
   }


   public Type TypeCheck(HashMap<String, SymbolEntry> locals, Type ret_type) {
       Type ret =  left.TypeCheck(locals, ret_type);

       if (ret instanceof StructType) {
           struct_name = ((StructType) ret).name;
           HashMap<String, StructField> cur = Program.struct_table.get(((StructType) ret).name);

           if (cur.containsKey(id)) {
                return cur.get(id).type;
           } else {
               System.err.println("Invalid expression on line " + lineNum + ", struct " + ((StructType) ret).name + " does not contain the field " + id);
               System.exit(1);
               return null;
           }

       } else {
           System.err.println("Invalid Left dot value on line " + lineNum + ": expected struct type");
           System.exit(1);
           return null;
       }
   }

}
