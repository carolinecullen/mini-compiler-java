package llvm;

public class LoadResultLLVM
        implements InstructionLLVM {

    public Register result;
    String ty;
    String ptr;
    String ty2;

    public LoadResultLLVM (TypeLLVM t) {
        result = new Register(t);
        ty = t.getName() + "*";
        ty2 = t.getName();
    }

    public String toString() {
        return result + " = load " + ty2 + ", " + ty + " %_retval_";
    }
}
