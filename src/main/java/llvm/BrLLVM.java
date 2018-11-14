package llvm;

public class BrLLVM
    implements InstructionLLVM
{
    private String reg;
    private String el_block;
    private String th_block;

    public BrLLVM (String r, String th, String el) {
        reg = r;
        th_block = th;
        el_block = el;
    }

    public String toString() {
        return "br i1 " + reg + ", label %" + th_block + ", label %" + el_block;
    }
}
