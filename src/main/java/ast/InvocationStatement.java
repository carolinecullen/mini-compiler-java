package ast;

import llvm.CallLLVM;
import llvm.InstructionLLVM;

import java.util.HashMap;
import java.util.List;

public class InvocationStatement
   extends AbstractStatement
{
   public final Expression expression;

   public InvocationStatement(int lineNum, Expression expression)
   {
      super(lineNum);
      this.expression = expression;
   }

   public Type TypeCheck(HashMap<String, SymbolEntry> locals, Type ret_type) {
      return expression.TypeCheck(locals, ret_type);
   }

}
