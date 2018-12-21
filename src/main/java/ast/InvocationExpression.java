package ast;

import cfg.OptimizeCFG;
import llvm.CallLLVM;
import llvm.ExprReturn;
import llvm.ImmediateLLVM;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import static mini.MiniCompiler.no_opt;

public class InvocationExpression
   extends AbstractExpression
{
   private final String name;
   private final List<Expression> arguments;

   public InvocationExpression(int lineNum, String name,
      List<Expression> arguments)
   {
      super(lineNum);
      this.name = name;
      this.arguments = arguments;
   }

   public Type TypeCheck(HashMap<String, SymbolEntry> locals, Type ret_type) {

       if(!Program.glob_symbol_table.containsKey(name)) {
           System.err.println("Invalid invocation at line " + lineNum + ": " + name + " is not a function");
           System.exit(1);
           return null;
       }

       SymbolEntry cur = Program.glob_symbol_table.get(name);
       if (cur.type instanceof FunctionType) {
          ArrayList<Type> args = new ArrayList<>();
          for (Expression e: arguments) {
             args.add(e.TypeCheck(locals, ret_type));
          }

          FunctionType new_cur = (FunctionType) cur.type;
          if ((new_cur.parameters.size()) != (args.size())) {
             System.err.println("Invalid parameters do not match: " + name + " and invocation do not have the same amount of arguments");
             System.exit(1);
             return null;
          }

           int i = 0;
           for(Declaration dec: new_cur.parameters) {
               if(args.get(i) instanceof NullType && dec.type instanceof StructType) {
                   i++;
                   continue;
               } else if(args.get(i) instanceof FunctionType) {
                   FunctionType ft = (FunctionType)args.get(i);
                   if (ft.return_type.getClass().equals(dec.type.getClass())) {
                       i++;
                       continue;
                   } else {
                       System.err.println("Invalid invocation at line " + lineNum + ": " + name + " and invocation do not have matching parameter types for index " + i);
                       System.exit(1);
                       return null;
                   }
               } else {
                   if(!(args.get(i).getClass().equals(dec.type.getClass())))  {
                       System.err.println("Invalid invocation at line " + lineNum + ": " + name + " and invocation do not have matching parameter types for index " + i);
                       System.exit(1);
                       return null;
                   }
               }
               i++;
           }

          return new_cur.return_type;

       } else {
          System.err.println("Invalid invocation at line " + lineNum + ": " + name + " is not a function");
          System.exit(1);
          return null;
       }

   }

   public ExprReturn getLLVM (cfg.CfgNode c, ast.Function f) {
       SymbolEntry ret_f = ast.Program.glob_symbol_table.get(name);
       Type ret = null;

       ArrayList<ExprReturn> l = new ArrayList<>();
       for(Expression e: arguments) {
           l.add(e.getLLVM(c, f));
       }

       FunctionType ret_func = null;
       if(ret_f.type instanceof FunctionType) {
           ret_func = (FunctionType)ret_f.type;
           ret = ret_func.return_type;
       } else {
           System.err.println("Expected function type for call expression");
           System.exit(1);
       }

       CallLLVM ni = new CallLLVM(name, l, ret.getLLVMType(), ret_func.parameters);

       if(OptimizeCFG.containsFunc(name) && !no_opt) {
           ExprReturn ret_inline = OptimizeCFG.inlineCall(c, ni);
           return ret_inline;
       } else {
           c.llvm_instructions.add(ni);
           return ni.result;
       }
   }

}
