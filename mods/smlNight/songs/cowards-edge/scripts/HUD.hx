//
import flixel.ui.FlxBar;
import flixel.text.FlxTextBorderStyle;

var fakeScore:FunkinText;

var camHUD2:FlxCamera;
FlxG.cameras.remove(camHUD, false);
FlxG.cameras.add(camHUD2 = new HudCamera(), false);
FlxG.cameras.add(camHUD, false);
camHUD2.bgColor = 0;

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

    tiktokBottom = new FunkinSprite(360, 670).loadGraphic(Paths.image("game/ui/tiktok"));
    tiktokBottom.antialiasing = true;
    tiktokBottom.cameras = [camHUD2];
    tiktokBottom.scale.set(0.9, 0.9);
    add(tiktokBottom);

    timeBar = new FlxBar(410, 670, FlxBar.FILL_LEFT_TO_RIGHT, 530, 3, Conductor, 'songPosition', 0, 1);
    timeBar.createFilledBar(0xFF000000,0xFFFFFFFF);
    timeBar.cameras = [camHUD2];
    timeBar.numDivisions = 400;
    timeBar.unbounded = true;
    add(timeBar);
}


var timebarLerp = 1;
function postUpdate() {
    if (inst != null && timeBar != null && timeBar.max != inst.length) timeBar.setRange(0, Math.max(1, inst.length));
    fakeScore.text = songScore; 
}

function onNoteHit(event) {
    event.enableCamZooming = false;
}

function onPostStrumCreation(e) {
    e.strum.scale.set(0.65, 0.65);
}