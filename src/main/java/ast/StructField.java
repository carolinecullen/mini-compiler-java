package ast;

public class StructField {
    public int index;
    public Type type;

    public StructField(Type t, int i )
    {
        index = i;
        type = t;
    }
}
