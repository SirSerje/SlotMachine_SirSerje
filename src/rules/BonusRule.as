package rules {

import Config;

import items.IItem;

import models.BonusLine;

import models.ILine;
import models.ScatterLine;

public class BonusRule extends AbstractRule implements IRule {
    private var _winItem:IItem;
    public function BonusRule(value:int) {
        super(value);
    }

    public function checkWinOnLine(value:ILine):Boolean {
        if(!(value is BonusLine)) {return false;}
        var currentItem:IItem;
        var validItem:IItem;
        var exceptItem:IItem;
        var anyItem:IItem;
        var firstItem:IItem;
        var total:int = 0;
        var any:int = 0;
        var flag:Boolean = false;
        var currentPay:int = 0;
        for (var i:int = 0; i < value.items.length; i++) {
            currentItem = value.items[i];
            //check exception
            for (var j:int = 0; j < _usingItems.length; j++) {
                if(flag) break;
                anyItem = _usingItems[j];
                if (compare(currentItem, anyItem)) {
                    firstItem = currentItem;
                    total++;
                    if(total == _itemsNeedToWin) {
                        flag = true;
                    }
                }
            }
            //end of check exception
        }
        if(total == _itemsNeedToWin) {
            if (firstItem.getPay()["cost"]) {
                currentPay = firstItem.getPay()["cost"];
                _winItem = firstItem;
                _winPay += currentPay;
            }
        }
        return (total == _itemsNeedToWin)
    }

    public function countPay(i:int):int {
        if(i == 0) {
            return countTotal();
        }
        return i * _winItem.getPay()["costBonus"];
    }

    public function get name():String {
        return "BONUS";
    }

}
}
