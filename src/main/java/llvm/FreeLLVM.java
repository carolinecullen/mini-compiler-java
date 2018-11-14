package llvm;

public class FreeLLVM
    implements InstructionLLVM
{
    String reg;

    public FreeLLVM (Register r) {
        reg = r.reg_name;
    }

    public String toString() {
       return "call void @free(i8* " + reg + ")";
    }

}
