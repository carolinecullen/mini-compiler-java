package ast;

import llvm.ExprReturn;
import llvm.IdLLVM;
import llvm.LoadLLVM;
import llvm.Register;

import java.util.HashMap;

public class IdentifierExpression
   extends AbstractExpression
{
   private final String id;

   public IdentifierExpression(int lineNum, String id)
   {
      super(lineNum);
      this.id = id;
   }

   public Type TypeCheck(HashMap<String, SymbolEntry> locals, Type ret_type) {
       if (locals.containsKey(id)) {
           SymbolEntry cur =  locals.get(id);
           return cur.type;
       } else if (Program.glob_symbol_table.containsKey(id)) {
           SymbolEntry cur =  Program.glob_symbol_table.get(id);

           if (cur.type instanceof FunctionType) {
               return ((FunctionType) cur.type).return_type;
           } else {
               return cur.type;
           }
       } else if (Program.struct_table.containsKey(id)) {
           return new StructType(0, id);
       } else {
           System.err.println("Invalid identifier on line " + lineNum + ": id \"" + id + "\" is not declared for current scope");
           System.exit(1);
           return null;
       }
   }

   public ExprReturn getLLVM(cfg.CfgNode c, ast.Function f) {
       SymbolEntry cur;
       if (f.local_symbol_table.containsKey(id)) {
           cur = f.local_symbol_table.get(id);
       } else if (Program.glob_symbol_table.containsKey(id)) {
           cur = Program.glob_symbol_table.get(id);
       } else if (Program.struct_table.containsKey(id)) {
           cur = new SymbolEntry(new StructType(0, id), SymbolEntry.Scope.GLOB);
       } else {
           System.err.println("Invalid identifier on line " + lineNum + ": id \"" + id + "\" is not declared for current scope");
           System.exit(1);
           return null;
       }

       LoadLLVM l;
       if(cur.scope.equals(SymbolEntry.Scope.PARAM)) {
           l = new LoadLLVM(new Register(new IdLLVM("_P_"+id, SymbolEntry.Scope.PARAM)), cur.type.getLLVMType());
       } else if(cur.scope.equals(SymbolEntry.Scope.GLOB)) {
           l = new LoadLLVM(new Register(new IdLLVM(id, SymbolEntry.Scope.GLOB)), cur.type.getLLVMType());
       } else {
           l = new LoadLLVM(new Register(new IdLLVM(id, SymbolEntry.Scope.LOC)), cur.type.getLLVMType());
       }

       c.llvm_instructions.add(l);
       return l.result;
   }
}
