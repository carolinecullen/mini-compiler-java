package ast;

import llvm.StructPtrLLVM;
import llvm.TypeLLVM;

public class StructType
   implements Type
{
   public final int lineNum;
   public final String name;

   public StructType(int lineNum, String name)
   {
      this.lineNum = lineNum;
      this.name = name;
   }

   public Type TypeCheck() {
      return this;
   }

    public TypeLLVM getLLVMType() {
        return new StructPtrLLVM(name);
    }

}
