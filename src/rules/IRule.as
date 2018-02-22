package rules {
import models.ILine;

public interface IRule {
    function checkWinOnLine(value:ILine):Boolean
    function countPay(i:int):int;
    function get name():String;
}
}
