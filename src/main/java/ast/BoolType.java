package ast;

import llvm.BoolLLVM;
import llvm.TypeLLVM;

public class BoolType
   implements Type
{
    public Type TypeCheck() {
        return this;
    }

    public TypeLLVM getLLVMType(){
        return new BoolLLVM();
    }

}
