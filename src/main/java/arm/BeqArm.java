package arm;

public class BeqArm {

    private String label;

    public BeqArm (String l) {
        label = l;
    }


    public String toString() {
        return "beq ." + label;
    }
}
