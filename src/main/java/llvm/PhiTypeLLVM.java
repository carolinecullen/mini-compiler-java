package llvm;


public class PhiTypeLLVM
{
    TypeLLVM ty;
    String label;

    PhiTypeLLVM (String l, TypeLLVM t) {
        ty = t;
        label = l;
    }
}
