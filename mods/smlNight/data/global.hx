//
import funkin.editors.ui.UIState;
import lime.graphics.Image;
import funkin.backend.system.framerate.Framerate;
import funkin.backend.system.framerate.FramerateCounter;
import funkin.backend.utils.WindowUtils;
import funkin.game.GameOverSubstate;
import funkin.menus.PauseSubState;

import openfl.text.TextFormat;


static var windowTitle:String = "SML Movie: Night Funkin!";
public static var searchEntry:String = "search";
static var curMainMenuSelected:Int = 0;
static var redirectStates:Map<FlxState, String> = [
    TitleState => "NFTitleState"
    // LMAOOOOOOO
    MainMenuState => "NFMenuState"
    FreeplayState => "NFMenuState"
    // StoryMenuState => "funkystory"
];

function update(elapsed:Float){
    if (FlxG.keys.justPressed.F5) FlxG.resetState();
    Framerate.codenameBuildField.text = "Night Funkin' V1";
}

function preStateSwitch(){
    window.title = windowTitle;

        
    for (label in [Main.framerateSprite.codenameBuildField, Main.framerateSprite.fpsCounter.fpsNum, Main.framerateSprite.fpsCounter.fpsLabel])
        label.setTextFormat(new TextFormat(Paths.font("vcr.ttf")));

    Main.framerateSprite.codenameBuildField.y =  Main.framerateSprite.memoryCounter.y;
    Main.framerateSprite.memoryCounter.visible = false;

    window.setIcon(Image.fromBytes(Assets.getBytes(Paths.image('game/icon'))));
    for (redirectState in redirectStates.keys())
        if (Std.isOfType(FlxG.game._requestedState, redirectState))
            FlxG.game._requestedState = new UIState(true, redirectStates.get(redirectState));
}

function destroy(){
    WindowUtils.resetTitle();
}