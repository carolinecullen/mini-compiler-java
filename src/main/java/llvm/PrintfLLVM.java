package llvm;

public class PrintfLLVM
    implements InstructionLLVM
{
    String reg;
    String ty;

    public PrintfLLVM (Register r) {
        reg = r.reg_name;
        ty = r.reg_type.getName();
    }

    public PrintfLLVM (ImmediateLLVM r) {
        reg = r.num;
        ty = "i32";
    }

    public String toString() {
        return "call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), " + ty + " " + reg + ")";
    }
}
