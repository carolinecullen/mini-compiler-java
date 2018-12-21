package ast;

import javax.sound.midi.SysexMessage;
import java.util.HashMap;
import java.util.List;

public class Function
{
   private final int lineNum;
   public final String name;
   public final Type retType;
   public final List<Declaration> params;
   public final List<Declaration> locals;
   public final Statement body;
   public HashMap<String, SymbolEntry> local_symbol_table;

   public Function(int lineNum, String name, List<Declaration> params,
      Type retType, List<Declaration> locals, Statement body)
   {
      this.lineNum = lineNum;
      this.name = name;
      this.params = params;
      this.retType = retType;
      this.locals = locals;
      this.body = body;
      this.local_symbol_table = CreateLocalSymbolTable();
   }

   private HashMap<String, SymbolEntry> CreateLocalSymbolTable () {
      HashMap <String, SymbolEntry> init_table = new HashMap<>();
      for (Declaration local: locals) {
         init_table.put(local.name, new SymbolEntry(local.type, SymbolEntry.Scope.LOC));
      }

      for (Declaration param: params) {
         init_table.put(param.name, new SymbolEntry(param.type, SymbolEntry.Scope.PARAM));
      }
      return init_table;
   }

   public Type TypeCheck()
   {
      body.TypeCheck(local_symbol_table, retType);
      body.returnCheck();
      return null;
   }
}
