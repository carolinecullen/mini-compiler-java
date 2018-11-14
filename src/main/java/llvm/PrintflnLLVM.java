package llvm;

public class PrintflnLLVM
        implements InstructionLLVM
{
    String reg;
    String ty;

    public PrintflnLLVM (Register r) {
        reg = r.reg_name;
        ty = r.reg_type.getName();
    }

    public PrintflnLLVM (ImmediateLLVM r) {
        reg = r.num;
        ty = "i32";
    }

    public String toString() {
        return "call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), " + ty + " " + reg + ")";
    }
}
