package llvm;


public class GetPtrLLVM
    implements InstructionLLVM {

    public Register result;
    String ty;
    String ptrval;
    String ty2;
    IOneLLVM eye_one = new IOneLLVM();
    int index;

    public GetPtrLLVM(Register r, StructPtrLLVM n, TypeLLVM t, int i) {
        result = new Register(t);
        ty = n.getName();
        ty2 = n.getName().substring(0, n.getName().length()-1);
        ptrval = r.reg_name;
        index = i;
    }

    public String toString() {
        return result.reg_name + " = getelementptr "+ ty2 +", " + ty + " " + ptrval + ", " + eye_one.name + " 0, i32 " + index;
    }
}
