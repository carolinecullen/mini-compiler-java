package llvm;

public class ZextLLVM
        implements InstructionLLVM
{
    String value;
    public Register result;

    public ZextLLVM (String n) {
        result = new Register(new BoolLLVM());
        value = n;
    }

    public String toString() {
        return result + " = zext i1 " + value + " to i32";
    }

}
