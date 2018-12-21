package arm;

public class BlArm {

    private String label;

    public BlArm (String l) {
        label = l;
    }


    public String toString() {
        return "bl " + label;
    }

}
