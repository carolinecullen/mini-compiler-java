package llvm;

public class BrLabelLLVM
        implements InstructionLLVM
{
    private String label;

    public BrLabelLLVM (String l) {
        label = l;
    }

    public String toString() {
        return "br label %" + label;
    }
}
