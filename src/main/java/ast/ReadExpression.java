package ast;

import llvm.ExprReturn;
import llvm.IntLLVM;
import llvm.ReadLLVM;
import llvm.Register;
import mini.MiniCompiler;

import java.util.HashMap;

import static cfg.Cfg.ssa;
import static mini.MiniCompiler.user_spec;

public class ReadExpression
   extends AbstractExpression
{
   public ReadExpression(int lineNum)
   {
      super(lineNum);
   }

   public Type TypeCheck(HashMap<String, SymbolEntry> locals, Type ret_type) {
      return new NullType();
   }

   public ExprReturn getLLVM(cfg.CfgNode c, ast.Function f) {
        ReadLLVM read = new ReadLLVM();
        c.llvm_instructions.add(read);
        return read.result;
   }
}
