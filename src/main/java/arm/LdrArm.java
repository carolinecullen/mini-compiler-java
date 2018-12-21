package arm;

import ast.SymbolEntry;
import llvm.IdLLVM;
import llvm.Register;

public class LdrArm {

    private Register from;
    private Register into;

    public LdrArm(Register f, Register i) {
        from = f;
        into = i;
    }

    public LdrArm(String f, Register i) {
        from = new Register(new IdLLVM(f, i.reg_type, SymbolEntry.Scope.LOC));
        into = i;
    }

    public String toString() {
        return "ldr " + from.reg_name + ", [" + into.reg_name + "]";
    }
}
