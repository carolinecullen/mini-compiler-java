package ast;

public class Declaration
{
   private final int lineNum;
   public final Type type;
   public final String name;

   public Declaration(int lineNum, Type type, String name)
   {
      this.lineNum = lineNum;
      this.type = type;
      this.name = name;
   }


}
