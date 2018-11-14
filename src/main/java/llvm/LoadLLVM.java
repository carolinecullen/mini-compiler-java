package llvm;

public class LoadLLVM
    implements InstructionLLVM {

    public Register result;
    String ty;
    String ptr;
    String ty2;

    public LoadLLVM (Register r, TypeLLVM t) {
        result = new Register(t);
        ty = t.getName() + "*";
        ty2 = t.getName();
        ptr = r.reg_name;
    }

    public String toString() {
        return result + " = load " + ty2 + ", " + ty + " " + ptr;
    }
}
