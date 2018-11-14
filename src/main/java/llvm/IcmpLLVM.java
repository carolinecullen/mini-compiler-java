package llvm;


public class IcmpLLVM
        implements InstructionLLVM {

    public Register result;
    public String ty;
    public String cond;
    public String op1;
    public String op2;

    public IcmpLLVM(String cond_type, ExprReturn l, ExprReturn r) {
        if (l instanceof Register) {
            Register l_reg = (Register)l;
            ty = l_reg.reg_type.getName();
        } else {
            ty = "i32";
        }
        cond = cond_type;
        result = new Register(new IOneLLVM());
        op1 = l.toString();
        op2 = r.toString();
    }

    public String toString() {
        return result + " = icmp " + cond + " " + ty + " " + op1 + ", " + op2;
    }
}
