package ast;

import llvm.IntLLVM;
import llvm.TypeLLVM;

import java.util.List;


// This class is used EXCLUSIVELY for storing in symbol table
public class FunctionType
        implements Type
{
    public List<Declaration> parameters;
    public Type return_type;

    public FunctionType(List<Declaration> param_list, Type ret_type)
    {
        this.parameters = param_list;
        this.return_type = ret_type;
    }

    public Type TypeCheck() {
        return this;
    }

    public TypeLLVM getLLVMType(){
        return return_type.getLLVMType();
    }

}
