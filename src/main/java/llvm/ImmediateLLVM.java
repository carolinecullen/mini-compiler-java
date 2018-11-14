package llvm;

public class ImmediateLLVM
    implements ExprReturn {

//    enum ImmType {
//        Bool,
//        Integer
//    }

    public String num;

    public ImmediateLLVM (int n) {
        num = Integer.toString(n);
    }

    public ImmediateLLVM (IntLLVM t, int n) {
        num = t.name + " " + Integer.toString(n);
    }

    public String toString() {
        return num;
    }
}
