package rules {
import configuration.Config;

import models.ILine;
import models.ScatterLine;

public class BonusRule extends AbstractRule implements IRule {
    private var _itemName:String;
    public function BonusRule() {
        super();
    }

    public function checkWinOnLine(value:ILine):Boolean {
        if(!(value is ScatterLine)) return false;
        var total:int = 0;
        _itemName = "";
        for each(var m:String in value.items) {
            if(m==_bonusItem) {
                total++
            }
        }
        var a = Config.reelQuantity;
        return total == a;
    }

    public function isRuleAvailableForLine(line:ILine):Boolean {



        return true;
    }

    public function countPay(i:int):int {
        if(i == 0) {
            return 10;
        }
        return i * 1000;
    }

    public function get name():String {
        return "BONUS";
    }
}
}
