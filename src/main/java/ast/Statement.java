package ast;

import java.util.HashMap;

public interface Statement
{
    Type TypeCheck(HashMap<String, SymbolEntry> hm, Type rt);
}
