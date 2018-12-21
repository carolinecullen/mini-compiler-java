package llvm;

public class Register
    implements ExprReturn {

    public static int reg_counter = 0;
    public TypeLLVM reg_type;
    public String reg_name;
    public int ssa_id_num;

    public Register(TypeLLVM ty) {

        if (ty instanceof IdLLVM) {
            IdLLVM t = (IdLLVM) ty;
            ssa_id_num = 0;
            if (t.getName().charAt(0) == '@') {
                reg_name = t.getName();
                reg_type = ty;
            } else {
                reg_name = "%" + t.getName();
                reg_type = t.type;
            }
        } else if (ty instanceof NullLLVM) {
            reg_name = "null";
            reg_type = ty;
        } else {
            reg_name = "%u" + reg_counter++;
            reg_type = ty;
        }
    }

    public String toParamString() {
        return reg_type.getName() + " " + reg_name;
    }

    public String toString() {
        return reg_name;
    }

}
