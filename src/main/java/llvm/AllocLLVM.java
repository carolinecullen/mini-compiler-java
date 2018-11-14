package llvm;

import ast.SymbolEntry;

public class AllocLLVM
    implements InstructionLLVM
{

    Register result;
    String ty;

    public AllocLLVM(TypeLLVM t, String n, SymbolEntry.Scope sc) {
        if(sc == SymbolEntry.Scope.PARAM) {
            n = n.substring(1);
        }
        result = new Register(new IdLLVM(n, sc));
        ty = t.getName();
    }

    public String toString () {
        return result + " = alloca " + ty;
    }
}
