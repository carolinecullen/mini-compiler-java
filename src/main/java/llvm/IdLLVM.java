package llvm;

import ast.Program;
import ast.SymbolEntry;

public class IdLLVM
        implements TypeLLVM
{
    String name;
    SymbolEntry.Scope scope;

    public IdLLVM(String id, SymbolEntry.Scope sc) {
        name = id;
        scope = sc;
    }

    public String getName() {
        if(scope == SymbolEntry.Scope.GLOB) {
            return "@" + name;
        } else {
            return name;
        }
    }
}
