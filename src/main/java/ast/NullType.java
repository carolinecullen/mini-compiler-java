package ast;

import llvm.NullLLVM;
import llvm.TypeLLVM;

public class NullType
        implements Type
{
    public Type TypeCheck() {
        return this;
    }
    public TypeLLVM getLLVMType(){

        return new NullLLVM();
    }

}