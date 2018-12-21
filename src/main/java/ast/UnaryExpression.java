package ast;

import llvm.ExprReturn;
import llvm.ImmediateLLVM;
import llvm.SubLLVM;
import llvm.XorLLVM;
import mini.MiniCompiler;

import java.util.HashMap;

import static cfg.Cfg.ssa;
import static mini.MiniCompiler.user_spec;

public class UnaryExpression
   extends AbstractExpression
{
   private final Operator operator;
   private final Expression operand;

   private UnaryExpression(int lineNum, Operator operator, Expression operand)
   {
      super(lineNum);
      this.operator = operator;
      this.operand = operand;
   }

   public static UnaryExpression create(int lineNum, String opStr,
      Expression operand)
   {
      if (opStr.equals(NOT_OPERATOR))
      {
         return new UnaryExpression(lineNum, Operator.NOT, operand);
      }
      else if (opStr.equals(MINUS_OPERATOR))
      {
         return new UnaryExpression(lineNum, Operator.MINUS, operand);
      }
      else
      {
         throw new IllegalArgumentException();
      }
   }

   private static final String NOT_OPERATOR = "!";
   private static final String MINUS_OPERATOR = "-";

   public static enum Operator
   {
      NOT, MINUS
   }

   public Type TypeCheck(HashMap<String, SymbolEntry> locals, Type ret_type) {
      switch (operator)
      {
         case NOT:
            return TypeCheckNot(operand, locals, ret_type);
         case MINUS:
            return TypeCheckMinus(operand, locals, ret_type);
         default:
            throw new IllegalArgumentException();
      }

   }

   private Type TypeCheckMinus(ast.Expression operand, HashMap<String, SymbolEntry> locals, Type ret_type) {
      Type ret_check_operand = operand.TypeCheck(locals, ret_type);
      if (ret_check_operand instanceof IntType) {
         return ret_check_operand;
      } else {
         System.err.println("Invalid unary operand: expected integer");
         System.exit(1);
         return null;
      }
   }

   private Type TypeCheckNot(ast.Expression operand, HashMap<String, SymbolEntry> locals, Type ret_type) {
      Type ret_check_operand = operand.TypeCheck(locals, ret_type);
      if (ret_check_operand instanceof BoolType) {
         return ret_check_operand;
      } else {
         System.err.println("Invalid unary operand: expected boolean");
         System.exit(1);
         return null;
      }
   }

   public ExprReturn getLLVM (cfg.CfgNode c, ast.Function f) {
       ExprReturn oprnd = operand.getLLVM(c, f);

       switch (operator)
       {
           case NOT: {
               if (oprnd instanceof ImmediateLLVM) {
                   ImmediateLLVM hld = (ImmediateLLVM)oprnd;
                   if(hld.num.equals("1")){
                       hld.num = "0";
                   } else {
                       hld.num = "1";
                   }
                   return hld;
               } else {
                    XorLLVM x = new XorLLVM(oprnd, new ImmediateLLVM(1));
                    c.llvm_instructions.add(x);
                    return x.result;
               }
           }
           case MINUS: {
               if (oprnd instanceof ImmediateLLVM) {
                   ImmediateLLVM hld = (ImmediateLLVM)oprnd;
                   hld.num = "-" + hld.num;
                   return hld;
               } else {
                   SubLLVM sub = new SubLLVM(new ImmediateLLVM(0), oprnd);
                   c.llvm_instructions.add(sub);
                   return sub.result;
               }
           }

           default:
               throw new IllegalArgumentException();
       }
   }
}
