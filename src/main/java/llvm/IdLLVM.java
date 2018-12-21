package llvm;

import ast.Program;
import ast.SymbolEntry;

public class IdLLVM
        implements TypeLLVM
{
    String name;
    SymbolEntry.Scope scope;
    public TypeLLVM type;

    public IdLLVM(String id, TypeLLVM ty, SymbolEntry.Scope sc) {
        name = id;
        scope = sc;
        type = ty;

    }

    public String getName() {
        if(scope == SymbolEntry.Scope.GLOB) {
            return "@" + name;
        } else {
            return name;
        }
    }
}
