package llvm;

import java.util.ArrayList;

public class PhiLLVM
    implements InstructionLLVM
{
    String ty;
    ArrayList<PhiLLVM> all_phis = new ArrayList<>();

    PhiLLVM (TypeLLVM t) {
        ty = t.getName();
    }
}
