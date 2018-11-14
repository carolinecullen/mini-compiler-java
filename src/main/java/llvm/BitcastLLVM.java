package llvm;

public class BitcastLLVM
    implements InstructionLLVM
{

    String from;
    String to;
    String ft;
    public Register result;

    public BitcastLLVM (Register r, TypeLLVM t) {
        result = new Register(t);
        from = r.reg_name;
        ft = r.reg_type.getName();
        to = t.getName();
    }

    public String toString() {
        return result + " = bitcast " + ft + " " + from + " to " + to;
    }
}
