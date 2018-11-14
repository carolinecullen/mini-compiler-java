package llvm;

public class NullLLVM
        implements TypeLLVM
{
    String name = "null";

    public static Register getExprReturn() {
        return new Register(new NullLLVM());
    }

    public String getName() {
        return name;
    }
}
