package llvm;

public class Tuple<X, Y> {
    public final X name;
    public final Y branch;
    public Tuple(X x, Y y) {
        this.name = x;
        this.branch = y;
    }
}