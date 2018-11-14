package ast;

import llvm.ExprReturn;
import java.util.HashMap;

public interface Expression
{
    Type TypeCheck(HashMap<String, SymbolEntry> hm, Type return_type);

    ExprReturn getLLVM(cfg.CfgNode c, ast.Function f);
}
