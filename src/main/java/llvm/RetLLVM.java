package llvm;

public class RetLLVM
        implements InstructionLLVM
{
    String ty;
    String reg;

    public RetLLVM(Register r) {
        ty = r.reg_type.getName();
        reg = r.reg_name;
    }

    public String toString () {
        return "ret " + ty + " " + reg;
    }
}