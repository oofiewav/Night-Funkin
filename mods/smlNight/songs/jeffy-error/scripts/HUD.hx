//
import flixel.text.FlxTextBorderStyle;
import Sys;

var fakeScore:FunkinText;

function postCreate() {
    for(i in [accuracyTxt, missesTxt, scoreTxt, iconP1, iconP2, healthBar, healthBarBG]) {
        i.visible = false;
    }

    fakeScore = new FunkinText(0, 176, FlxG.width, "");
    
    fakeScore.setFormat(Paths.font("arial.ttf"), 24, FlxColor.WHITE, 'center', FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    fakeScore.borderSize = 2;
    FlxTween.tween(fakeScore, {alpha: 1}, 1, {type: FlxTween.PINGPONG});
    fakeScore.alpha = 0.5;
    fakeScore.cameras = [camHUD];
    add(fakeScore);
}

function postUpdate() {
    fakeScore.text = songScore; 
}

function onPlayerHit(doofus) {
    songScore += doofus.score;
}

function onPlayerMiss() {
    health = -10;
    Sys.exit(0);
}