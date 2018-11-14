package ast;

import llvm.*;

import java.util.HashMap;

public class DotExpression
   extends AbstractExpression
{
   private final Expression left;
   private final String id;

   public DotExpression(int lineNum, Expression left, String id)
   {
      super(lineNum);
      this.left = left;
      this.id = id;
   }

   public Type TypeCheck(HashMap<String, SymbolEntry> locals, Type ret_type) {
      Type ret =  left.TypeCheck(locals, ret_type);

      if (ret instanceof StructType) {
         HashMap<String, StructField> cur = Program.struct_table.get(((StructType) ret).name);

         if (cur.containsKey(id)) {
            return cur.get(id).type;
         } else {
            System.err.println("Invalid expression on line " + lineNum + ", struct " + ((StructType) ret).name + " does not contain the field " + id);
            System.exit(1);
            return null;
         }

      } else {
         System.err.println("Invalid Left dot value: expected struct type");
         System.exit(1);
         return null;
      }
   }

   public ExprReturn getLLVM(cfg.CfgNode c, ast.Function f) {
       ExprReturn e = left.getLLVM(c, f);

       if(e instanceof Register) {
           Register hld = (Register)e;

           if (hld.reg_type instanceof StructPtrLLVM) {
               StructPtrLLVM hld1 = (StructPtrLLVM)hld.reg_type;
               HashMap<String, StructField> ret_tbl = Program.struct_table.get(hld1.getStructName());

               GetPtrLLVM gptr = new GetPtrLLVM(hld, hld1, ret_tbl.get(id).type.getLLVMType(), ret_tbl.get(id).index);
               LoadLLVM ld = new LoadLLVM(gptr.result, ret_tbl.get(id).type.getLLVMType());
               c.llvm_instructions.add(gptr);
               c.llvm_instructions.add(ld);

               return ld.result;
           } else {
               // should not get here
               System.err.println("Invalid Left dot value: expected struct type");
               System.exit(1);
               return null;
           }

       } else {
            // should not get here
           System.err.println("Dot expr lhs m,ust return a register");
           System.exit(1);
           return null;
       }
   }

}
