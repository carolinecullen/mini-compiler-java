package llvm;

public class StructPtrLLVM
    implements TypeLLVM {

    String name;
    String struct_name;

    public StructPtrLLVM (String n) {
        struct_name = n;
        name = "%struct." + n + "*";
    }

    public String getName() {
        return name;
    }

    public String getStructName() {
        return struct_name;
    }
}
