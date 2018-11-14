package llvm;

public class MallocLLVM
        implements InstructionLLVM {

    public Register result;
    public int size;

    public MallocLLVM (int s) {
        result = new Register(new IEightLLVM());
        size = s;
    }

    public String toString() {
        return result + " = call i8* @malloc_helper(i32 " + size + ")";
    }
}
