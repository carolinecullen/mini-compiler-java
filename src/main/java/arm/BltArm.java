package arm;

public class BltArm {

    private String label;

    public BltArm (String l) {
        label = l;
    }


    public String toString() {
        return "blt ." + label;
    }
}
