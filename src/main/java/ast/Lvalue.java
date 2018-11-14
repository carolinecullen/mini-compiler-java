package ast;

import java.util.HashMap;

public interface Lvalue
{
    Type TypeCheck(HashMap<String, SymbolEntry> hm, Type return_type);
}
