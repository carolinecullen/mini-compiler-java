package arm;

public class BleArm {

    private String label;

    public BleArm (String l) {
        label = l;
    }


    public String toString() {
        return "ble ." + label;
    }
}
