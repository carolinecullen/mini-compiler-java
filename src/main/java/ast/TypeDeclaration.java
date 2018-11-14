package ast;

import java.util.List;

public class TypeDeclaration
{
   public final int lineNum;
   public final String name;
   public final List<Declaration> fields;

   public TypeDeclaration(int lineNum, String name, List<Declaration> fields)
   {
      this.lineNum = lineNum;
      this.name = name;
      this.fields = fields;
   }
}
