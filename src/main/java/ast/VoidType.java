package ast;

import llvm.TypeLLVM;
import llvm.VoidLLVM;

public class VoidType
   implements Type
{
    public Type TypeCheck() {
        return this;
    }

    public TypeLLVM getLLVMType() {
        return new VoidLLVM();
    }
}
