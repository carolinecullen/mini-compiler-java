package ast;

import llvm.*;

import java.util.HashMap;

public class BinaryExpression
   extends AbstractExpression
{
   private final Operator operator;
   private final Expression left;
   private final Expression right;

   private BinaryExpression(int lineNum, Operator operator,
      Expression left, Expression right)
   {
      super(lineNum);
      this.operator = operator;
      this.left = left;
      this.right = right;
   }

   public static BinaryExpression create(int lineNum, String opStr,
      Expression left, Expression right)
   {
      switch (opStr)
      {
         case TIMES_OPERATOR:
            return new BinaryExpression(lineNum, Operator.TIMES, left, right);
         case DIVIDE_OPERATOR:
            return new BinaryExpression(lineNum, Operator.DIVIDE, left, right);
         case PLUS_OPERATOR:
            return new BinaryExpression(lineNum, Operator.PLUS, left, right);
         case MINUS_OPERATOR:
            return new BinaryExpression(lineNum, Operator.MINUS, left, right);
         case LT_OPERATOR:
            return new BinaryExpression(lineNum, Operator.LT, left, right);
         case LE_OPERATOR:
            return new BinaryExpression(lineNum, Operator.LE, left, right);
         case GT_OPERATOR:
            return new BinaryExpression(lineNum, Operator.GT, left, right);
         case GE_OPERATOR:
            return new BinaryExpression(lineNum, Operator.GE, left, right);
         case EQ_OPERATOR:
            return new BinaryExpression(lineNum, Operator.EQ, left, right);
         case NE_OPERATOR:
            return new BinaryExpression(lineNum, Operator.NE, left, right);
         case AND_OPERATOR:
            return new BinaryExpression(lineNum, Operator.AND, left, right);
         case OR_OPERATOR:
            return new BinaryExpression(lineNum, Operator.OR, left, right);
         default:
            throw new IllegalArgumentException();
      }
   }

   private static final String TIMES_OPERATOR = "*";
   private static final String DIVIDE_OPERATOR = "/";
   private static final String PLUS_OPERATOR = "+";
   private static final String MINUS_OPERATOR = "-";
   private static final String LT_OPERATOR = "<";
   private static final String LE_OPERATOR = "<=";
   private static final String GT_OPERATOR = ">";
   private static final String GE_OPERATOR = ">=";
   private static final String EQ_OPERATOR = "==";
   private static final String NE_OPERATOR = "!=";
   private static final String AND_OPERATOR = "&&";
   private static final String OR_OPERATOR = "||";

   public static enum Operator
   {
      TIMES, DIVIDE, PLUS, MINUS, LT, GT, LE, GE, EQ, NE, AND, OR
   }

   public Type TypeCheck(HashMap<String, SymbolEntry> locals, Type ret_type) {
      switch (operator)
      {
         case TIMES:
            return TypeCheckForInts(left, right, locals, ret_type);
         case DIVIDE:
            return TypeCheckForInts(left, right, locals, ret_type);
         case PLUS:
            return TypeCheckForInts(left, right, locals, ret_type);
         case MINUS:
            return TypeCheckForInts(left, right, locals, ret_type);
         case LT:
            return TypeCheckForInts(left, right, locals, ret_type);
         case LE:
            return TypeCheckForInts(left, right, locals, ret_type);
         case GT:
            return TypeCheckForInts(left, right, locals, ret_type);
         case GE:
            return TypeCheckForInts(left, right, locals, ret_type);
         case EQ:
            return TypeCheckForInts(left, right, locals, ret_type);
         case NE:
            return TypeCheckForInts(left, right, locals, ret_type);
         case AND:
            return TypeCheckForBools(left, right, locals, ret_type);
         case OR:
            return TypeCheckForBools(left, right, locals, ret_type);
         default:
            throw new IllegalArgumentException();
      }

   }

   public Type TypeCheckForInts(ast.Expression left, ast.Expression right, HashMap<String, SymbolEntry> locals, Type ret_type) {
       if(operator == Operator.NE || operator == Operator.EQ) {
           return HandleEqualNotEqual(left, right, locals, ret_type);
       } else {
           Type ret_check_left = left.TypeCheck(locals, ret_type);
           if (ret_check_left instanceof IntType) {
               Type ret_check_right = right.TypeCheck(locals, ret_type);
               if (ret_check_right instanceof IntType) {
                   switch (operator) {
                       case TIMES:
                           return ret_check_right;
                       case DIVIDE:
                           return ret_check_right;
                       case PLUS:
                           return ret_check_right;
                       case MINUS:
                           return ret_check_right;
                       case LT:
                           return new BoolType();
                       case LE:
                           return new BoolType();
                       case GT:
                           return new BoolType();
                       case GE:
                           return new BoolType();
                       default:
                           throw new IllegalArgumentException();
                   }
               } else {
                   System.err.println("Invalid binary operands on line " + lineNum + ": expected integers");
                   System.exit(1);
                   return null;
               }
           } else {
               System.err.println("Invalid binary operands on line " + lineNum + ": expected integers");
               System.exit(1);
               return null;
           }
       }
   }

   private Type HandleEqualNotEqual(ast.Expression left, ast.Expression right, HashMap<String, SymbolEntry> locals, Type ret_type) {
       Type ret_check_left = left.TypeCheck(locals, ret_type);
       if (ret_check_left instanceof IntType) {
           Type ret_check_right = right.TypeCheck(locals, ret_type);
           if(ret_check_right instanceof IntType) {
               return new BoolType();
           } else {
               System.err.println("Invalid eq/ne binary operands on line "+ lineNum +": expected integers");
               System.exit(1);
               return null;
           }
       } else if (ret_check_left instanceof StructType) {
           Type ret_check_right = right.TypeCheck(locals, ret_type);
           if(ret_check_right instanceof NullType || ret_check_right instanceof StructType) {
               return new BoolType();
           } else {
               System.err.println("Invalid eq/ne binary operands on line "+ lineNum +": expected null or struct type");
               System.exit(1);
               return null;
           }
       } else if (ret_check_left instanceof BoolType) {
           Type ret_check_right = right.TypeCheck(locals, ret_type);
           if(ret_check_right instanceof BoolType) {
               return new BoolType();
           } else {
               System.err.println("Invalid eq/ne binary operands on line "+ lineNum +": expected boolean type");
               System.exit(1);
               return null;
           }
       } else {
           System.err.println("Invalid eq/ne binary operands on line "+ lineNum);
           System.exit(1);
           return null;
       }
   }


   private Type TypeCheckForBools(ast.Expression left, ast.Expression right, HashMap<String, SymbolEntry> locals, Type ret_type) {
       Type ret_check_left = left.TypeCheck(locals, ret_type);
       if (ret_check_left instanceof BoolType) {
           Type ret_check_right = right.TypeCheck(locals, ret_type);
           if(ret_check_right instanceof BoolType) {
               return ret_check_right;
           } else {
               System.err.println("Invalid binary operands: expected booleans");
               System.exit(1);
               return null;
           }
       } else {
           System.err.println("Invalid binary operands: expected booleans");
           System.exit(1);
           return null;
       }
   }

   public ExprReturn getLLVM (cfg.CfgNode c, ast.Function f) {
       ExprReturn left_ret = left.getLLVM(c, f);
       ExprReturn right_ret = right.getLLVM(c, f);

       return getInstruct(left_ret, right_ret, c);
   }

   public ExprReturn getInstruct(ExprReturn left_ret, ExprReturn right_ret, cfg.CfgNode c) {
       switch (operator)
       {
           case TIMES: {
               MulLLVM m = new MulLLVM(left_ret, right_ret);
               c.llvm_instructions.add(m);
               return m.result;
           }
           case DIVIDE: {
               SdivLLVM sdiv = new SdivLLVM(left_ret, right_ret);
               c.llvm_instructions.add(sdiv);
               return sdiv.result;
           }
           case PLUS: {
               AddLLVM a = new AddLLVM(left_ret, right_ret);
               c.llvm_instructions.add(a);
               return a.result;
           }
           case MINUS: {
               SubLLVM sub = new SubLLVM(left_ret, right_ret);
               c.llvm_instructions.add(sub);
               return sub.result;
           }
           case LT: {
               IcmpLLVM icmp = new IcmpLLVM("slt", left_ret, right_ret);
               ZextLLVM zext = new ZextLLVM(icmp.result.reg_name);
               c.llvm_instructions.add(icmp);
               c.llvm_instructions.add(zext);
               return zext.result;
           }
           case LE: {
               IcmpLLVM icmp = new IcmpLLVM("sle", left_ret, right_ret);
               ZextLLVM zext = new ZextLLVM(icmp.result.reg_name);
               c.llvm_instructions.add(icmp);
               c.llvm_instructions.add(zext);
               return zext.result;
           }
           case GT: {
               IcmpLLVM icmp = new IcmpLLVM("sgt", left_ret, right_ret);
               ZextLLVM zext = new ZextLLVM(icmp.result.reg_name);
               c.llvm_instructions.add(icmp);
               c.llvm_instructions.add(zext);
               return zext.result;
           }
           case GE: {
               IcmpLLVM icmp = new IcmpLLVM("sge", left_ret, right_ret);
               ZextLLVM zext = new ZextLLVM(icmp.result.reg_name);
               c.llvm_instructions.add(icmp);
               c.llvm_instructions.add(zext);
               return zext.result;
           }
           case EQ: {
               IcmpLLVM icmp = new IcmpLLVM("eq", left_ret, right_ret);
               ZextLLVM zext = new ZextLLVM(icmp.result.reg_name);
               c.llvm_instructions.add(icmp);
               c.llvm_instructions.add(zext);
               return zext.result;
           }
           case NE: {
               IcmpLLVM icmp = new IcmpLLVM("ne", left_ret, right_ret);
               ZextLLVM zext = new ZextLLVM(icmp.result.reg_name);
               c.llvm_instructions.add(icmp);
               c.llvm_instructions.add(zext);
               return zext.result;
           }
           case AND: {
               AndLLVM and = new AndLLVM(left_ret, right_ret);
               c.llvm_instructions.add(and);
               return and.result;
           }
           case OR: {
               OrLLVM or = new OrLLVM(left_ret, right_ret);
               c.llvm_instructions.add(or);
               return or.result;
           }
           default:
               throw new IllegalArgumentException();
       }
   }
}
