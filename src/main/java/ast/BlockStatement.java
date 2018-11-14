package ast;

import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;

public class BlockStatement
   extends AbstractStatement
{
   public final List<Statement> statements;

   public BlockStatement(int lineNum, List<Statement> statements)
   {
      super(lineNum);
      this.statements = statements;
   }

   public static BlockStatement emptyBlock()
   {
      return new BlockStatement(-1, new ArrayList<>());
   }

   public Type TypeCheck(HashMap<String, SymbolEntry> locals, Type ret_type) {
       Type rt = new VoidType();
       for (Statement s: statements) {
           if (s instanceof ReturnEmptyStatement || s instanceof ReturnStatement)
           {
               rt = s.TypeCheck(locals, ret_type);
               break;
           }
           s.TypeCheck(locals, ret_type);
       }

       return ret_type;
   }

}
