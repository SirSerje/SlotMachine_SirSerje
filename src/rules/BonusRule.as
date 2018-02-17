package rules {
public class BonusRule extends AbstractRule implements IRule {
    public function BonusRule() {
        super();
    }

    public function checkWinOnLine(value:Array):Boolean {
        return false;
    }

    public function isRuleAvailableForLine():Boolean {
        return true;
    }

    public function countPay(i:int):int {
        if(i == 0) {
            return 10;
        }
        return i * 1000;
    }
}
}
