package arm;

public class BneArm {

    private String label;

    public BneArm (String l) {
        label = l;
    }


    public String toString() {
        return "bne ." + label;
    }
}
