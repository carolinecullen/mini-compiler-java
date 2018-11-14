package llvm;

public class StoreLLVM
    implements InstructionLLVM
{
    public String l_ty;
    public String l;
    public String r_ty;
    public String r;

    public StoreLLVM(TypeLLVM l_type, String lv, TypeLLVM r_type, String rv) {
        l_ty = l_type.getName();
        r_ty = r_type.getName();
        l = lv;
        r = rv;
    }

    public String toString() {
        return "store " + l_ty + " " + l + ", " + r_ty + "* " + r;
    }
}
