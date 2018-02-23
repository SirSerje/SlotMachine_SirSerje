package {
import controllers.Controller;
import controllers.IKeyboardInputHandler;

import flash.display.Sprite;
import flash.events.Event;

import models.IModel;
import models.Model;

import views.ComponentView;
import views.CompositeView;
import views.ConcreteCompositeView;
import views.MatchedRules;
import views.ReelsView;
import views.TotalMultiplierView;

public class Main extends Sprite {

    public function Main() {
        var model:IModel = new Model();
        var controller:IKeyboardInputHandler = new Controller(model);
        //create reel view
        var reelView:ComponentView = new ReelsView(model);
        //create matched rules view
        var matchingRulesView:ComponentView = new MatchedRules(model);
        //total payment view
        var totalMultiplier:ComponentView = new TotalMultiplierView(model);
        //collects all components and their data to textfield
        var compositeView:CompositeView = new ConcreteCompositeView(model, controller, this.stage);

        compositeView.add(reelView);
        compositeView.add(matchingRulesView);
        compositeView.add(totalMultiplier);
        addChild(compositeView);

        model.addEventListener(Event.CHANGE, compositeView.update);
    }
}
}
