package llvm;

public class XorLLVM
        implements InstructionLLVM
{
    public Register result;
    public String ty;
    public String op1;
    public String op2;

    public XorLLVM(ExprReturn l, ExprReturn r) {
        BoolLLVM n = new BoolLLVM();
        ty = n.name;
        result = new Register(new BoolLLVM());
        op1 = l.toString();
        op2 = r.toString();
    }

    public String toString() {
        return result + " = xor " + ty + " " + op1 + ", " + op2;
    }
}
