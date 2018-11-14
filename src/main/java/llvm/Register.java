package llvm;

public class Register
    implements ExprReturn {

    public static int reg_counter = 0;
    public TypeLLVM reg_type;
    public String reg_name;


    public Register(TypeLLVM ty) {
        reg_type = ty;

        if (ty instanceof IdLLVM) {
            IdLLVM t = (IdLLVM) ty;
            if (t.getName().charAt(0) == '@') {
                reg_name = t.getName();
            } else {
                reg_name = "%" + t.getName();
            }
        } else if (ty instanceof NullLLVM) {
            reg_name = "null";
        } else {
            reg_name = "%u" + reg_counter++;
        }
    }

    public String toParamString() {
        return reg_type.getName() + " " + reg_name;
    }

    public String toString() {
        return reg_name;
    }

}
