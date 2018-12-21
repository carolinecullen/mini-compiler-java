package arm;

public class BgeArm {

    private String label;

    public BgeArm (String l) {
        label = l;
    }


    public String toString() {
        return "bge ." + label;
    }
}
