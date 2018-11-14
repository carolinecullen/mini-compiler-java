package llvm;

public class ReadLLVM
    implements InstructionLLVM {

    public Register result;

    public ReadLLVM () {
        result = new Register(new IntLLVM());
    }

    public String toString() {
        return result + " = call i32 @read_helper()";
    }
}
