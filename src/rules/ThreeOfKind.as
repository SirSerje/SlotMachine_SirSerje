package rules {
import models.ILine;
import models.ScatterLine;

/**
 * Find win combination only in "3 of kind" items in line
 */
public class ThreeOfKind extends AbstractRule implements IRule {
    private var _itemName:String;
    private var _winNames:Array = [];

    public function ThreeOfKind() {
        super();
    }

    public function checkWinOnLine(value:ILine):Boolean {
        if(value is ScatterLine) {
            return false;
        }
        var previous:String = "";
        var total:int = 0;
        var wild:int = 0;
        var m:String = "";
        var first:String = "";
        var itms:Array = []
        for (var i:int = 0; i < value.items.length; i++) {
            m = value.items[i];
            if (m == _exceptItem) return false;

            if (m == _wildItem) {
                wild++;
                if ((wild) == value.length) {
                    _itemName = _wildItem;
                    _winNames.push(_itemName);
                    return true;
                }
            }

            if (m == _bonusItem || m == _scatterItem) {
                return false;
            }

            if (suits(itms, m)) {
                itms.push(m);
                total++;
            }


        }

        if ((total) == value.length) {
            _winNames.push(itemInLine(value));
        }

        return (total) == value.length;
    }



    public function isRuleAvailableForLine(line:ILine):Boolean {
        return true;
    }

    public function countPay(i:int):int {
        return countTotal() + i;
    }

    private function suits(value:Array, check:String):Boolean {
        var current:String;
        if(value.length==0) {
            return true
        } else {
            for(var i:int=0; i<value.length; i++) {
                current = value[i];
                if(current == check || current == _wildItem) {
                    return true
                }
            }
        }
        return false;
    }

    private function itemInLine(value:ILine):String {
        for each(var i:String in value.items) {
            if (i == _wildItem) {
                continue
            } else {
                return i
            }
        }
        return null;
    }

    //In case of real slot payments of any line should be initialized by configs
    private function countTotal():int {
        var totalCount:int = 0;
        var current:String;
        for (var j:int = 0; j < _winNames.length; j++) {
            current = _winNames[j];
            switch (current) {
                case "WILD":
                    totalCount += 1000;
                    continue
                case "H7":
                    totalCount += 100;
                    continue
                case "BAR7":
                    totalCount += 25;
                    continue
                case "BAR3":
                    totalCount += 5;
                    continue
                case "BAR2":
                    totalCount += 4;
                    continue
                case "BAR1":
                    totalCount += 3;
                    continue
            }
        }
        _winNames = []; //TODO check this
        return totalCount;
    }
}
}
