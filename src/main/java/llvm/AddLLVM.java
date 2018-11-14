package llvm;

public class AddLLVM
        implements InstructionLLVM {

    public Register result;
    public String ty;
    public String op1;
    public String op2;

    public AddLLVM(ExprReturn l, ExprReturn r) {
        IntLLVM n = new IntLLVM();
        ty = n.name;
        if(l instanceof Register) {
            result = new Register(((Register) l).reg_type);
        } else {
            result = new Register(new IntLLVM());
        }
        op1 = l.toString();
        op2 = r.toString();
    }

    public String toString() {
        return result + " = add " + ty + " " + op1 + ", " + op2;
    }
}
