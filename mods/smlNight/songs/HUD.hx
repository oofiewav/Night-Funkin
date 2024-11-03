import flixel.FlxG;
import flixel.ui.FlxBar;
import flixel.util.FlxStringUtil;
import flixel.text.FlxTextBorderStyle;

var ratingStuff:Array<Dynamic> = [
    ['Dick', 0.5], 
    ['Gooch', 0.9], 
    ['Peepee!', 1], 
    ['SHIBBYYY!', 1]
];
var songsHideHud:Array<Dynamic> = [
    "Jeffy Error",
    "The Coward's Edge!"
];


var scoreTxtTween:FlxTween;
var missesTxtTween:FlxTween;
var accuracyTxtTween:FlxTween;

function postCreate() {
    for (e in [scoreTxt, missesTxt, accuracyTxt, iconP2, healthBar, healthBarBG]) {
        e.visible = false;
    }

    newScoreTxt = new FunkinText(35, 550, FlxG.width, "SCORE: 0");
    newScoreTxt.setFormat(Paths.font("arial.ttf"), 24, FlxColor.WHITE, 'LEFT', FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    newScoreTxt.borderSize = 2;
    newScoreTxt.cameras = [camHUD];
    add(newScoreTxt);

    newMissesTxt = new FunkinText(35, newScoreTxt.y + 40, FlxG.width, "MISSES: 0");
    newMissesTxt.setFormat(Paths.font("arial.ttf"), 24, FlxColor.WHITE, 'LEFT', FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    newMissesTxt.borderSize = 2;
    newMissesTxt.cameras = [camHUD];
    add(newMissesTxt);

    newAccuracyTxt = new FunkinText(35, newMissesTxt.y + 40, FlxG.width, "RATING: donhaftu");
    newAccuracyTxt.setFormat(Paths.font("arial.ttf"), 24, FlxColor.WHITE, 'LEFT', FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    newAccuracyTxt.borderSize = 2;
    newAccuracyTxt.cameras = [camHUD];
    add(newAccuracyTxt);

    timeBar = new FlxBar(5, healthBarBG.y + 60, FlxBar.FILL_LEFT_TO_RIGHT, 1280, 9, Conductor, 'songPosition', 0, 1);
    timeBar.createFilledBar(0x50FFFFFF, FlxColor.RED);
    timeBar.numDivisions = 400;
    timeBar.unbounded = true;
    timeBar.x = timeBar.x - 4;
    timeBar.y = timeBar.y - 4;
    timeBar.cameras = [camHUD];
    timeBar.scrollFactor.set();
    add(timeBar);

    playback = new FlxSprite(-5, healthBarBG.y + 54).loadGraphic(Paths.image("game/ui/playback"));
    playback.scale.set(1.25, 1.25);
    playback.cameras = [camHUD];
    add(playback);

    doIconBop = false;

    iconP1.scale.x = iconP1.scale.y = 1;

    if(songsHideHud.contains(SONG.meta.displayName)) {
        for(i in [newScoreTxt, newMissesTxt, newAccuracyTxt, timeBar, playback]) {
            i.visible = false;
        }
    }
    if(SONG.meta.displayName == "Chef Pee Pee's Hit Single!") {
        for(i in [timeBar, playback]) {
            i.visible = false;
        }
    }
}

function postUpdate() 
{
    iconP1.x = 1130;

    iconP1.y = healthBar.y - 100;

    if(downscroll) 
        iconP1.y = healthBar.y - 125;

    var rating:String = getRating(accuracy);
    var acc = (FlxMath.roundDecimal(accuracy * 100, 2) == -100 ? "0.00%" : FlxMath.roundDecimal(accuracy * 100, 2) + '%');

    iconP1.scale.set(lerp(iconP1.scale.x, 0.95, 0.1), lerp(iconP1.scale.y, 0.95, 0.1));

    if (inst != null && timeBar != null && timeBar.max != inst.length) timeBar.setRange(0, Math.max(1, inst.length));
    playback.x = lerp(-10, 1280, timeBar.percent / 100, true);

    newScoreTxt.text = "SCORE: " + songScore;
    newMissesTxt.text = "MISSES: " + misses;
    newAccuracyTxt.text = "RATING: " + rating;
}

function beatHit(curBeat){
    iconP1.scale.set(1.2,1.2);
}

function getRating(accuracy:Float):String {
    if (accuracy < 0) {
        return "donhaftu";
    }
    for (rating in ratingStuff) {
        if (accuracy < rating[1]) {
            return rating[0];
        }
    }
    return ratingStuff[ratingStuff.length - 1][0];
}