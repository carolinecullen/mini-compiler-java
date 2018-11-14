package ast;

public class SymbolEntry {

    public final Type type;
    public final Scope scope;

    public enum Scope {
        PARAM, GLOB, LOC
    }

    public SymbolEntry(Type t, Scope s) {

        this.type = t;
        this.scope = s;

    }
}
