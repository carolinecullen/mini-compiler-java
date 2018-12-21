package ast;

import java.util.HashMap;

public class ConditionalStatement
   extends AbstractStatement {
    public final Expression guard;
    public final Statement thenBlock;
    public final Statement elseBlock;

    public ConditionalStatement(int lineNum, Expression guard,
                                Statement thenBlock, Statement elseBlock) {
        super(lineNum);
        this.guard = guard;
        this.thenBlock = thenBlock;
        this.elseBlock = elseBlock;
    }

    public Type TypeCheck(HashMap<String, SymbolEntry> locals, Type ret_type) {
        if (guard.TypeCheck(locals, ret_type) instanceof BoolType) {

            Type hld = thenBlock.TypeCheck(locals, ret_type);
            Type hld_else = elseBlock.TypeCheck(locals, ret_type);
            if (hld_else.getClass().equals(hld.getClass())) {
                return hld;
            } else {
                System.err.println("Invalid conditional statement at line " + lineNum + ": then and else block return different types");
                System.exit(1);
                return null;
            }
        } else {
            System.err.println("Invalid conditional statement guard at line " + lineNum + ": guard must be boolean");
            System.exit(1);
            return null;
        }
    }

    public boolean returnCheck() {
        boolean then_store = thenBlock.returnCheck();
        if (!(then_store == elseBlock.returnCheck())) {
            if (elseBlock instanceof BlockStatement) {
                BlockStatement bs = (BlockStatement)elseBlock;
                if (bs.statements.isEmpty()) {
                    return then_store;
                } else {
                    System.err.println("Invalid conditional statement at line " + lineNum + ": one condition returns while the other does not");
                    System.exit(1);
                }
            } else {
                System.err.println("Invalid conditional statement at line " + lineNum + ": else block expected to be block statement");
                System.exit(1);
            }
        }

        return then_store;
    }

}
