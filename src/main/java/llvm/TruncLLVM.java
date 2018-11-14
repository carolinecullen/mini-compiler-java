package llvm;

public class TruncLLVM
    implements InstructionLLVM
{
    String ty_from;
    String value;
    public Register result;

    public TruncLLVM (String n, String ty) {
        result = new Register(new IOneLLVM());
        ty_from = ty;
        value = n;
    }

    public String toString() {
        return result + " = trunc " + ty_from + " " + value + " to i1";
    }

}
