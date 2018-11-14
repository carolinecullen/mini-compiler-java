package ast;

public abstract class AbstractStatement
   implements Statement
{
   public final int lineNum;

   public AbstractStatement(int lineNum)
   {
      this.lineNum = lineNum;
   }
}
