package models {

public class StraightLine extends AbstractLine implements ILine {
    public function StraightLine(items:Array) {
        super(items);
    }

    override public function get lineType():String {
        return "Straight";
    }
}
}
