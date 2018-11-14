package ast;

import llvm.TypeLLVM;

public interface Type
{
    Type TypeCheck();
    TypeLLVM getLLVMType();
}
