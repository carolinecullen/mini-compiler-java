package ast;

import llvm.IntLLVM;
import llvm.TypeLLVM;

public class IntType
   implements Type
{
    public Type TypeCheck() {
        return this;
    }

    public TypeLLVM getLLVMType(){
        return new IntLLVM();
    }
}
