package llvm;

public class IntLLVM
    implements TypeLLVM
{
    String name = "i32";

    @Override
    public String getName() {
        return name;
    }
}
