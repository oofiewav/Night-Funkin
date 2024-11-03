import flixel.text.FlxTextBorderStyle;
import flixel.text.FlxTextFormat;
import flixel.text.FlxTextFormatMarkerPair;

var creditBG:FlxSprite;
var otherText:FlxText;
var songName:FlxText;
var composerTxt:FlxText;

var camInfo:FlxCamera = new FlxCamera();
camInfo.bgColor = 0x00000000;
FlxG.cameras.add(camInfo, false);

function create() {
    otherText = new FlxText(0, 330, FlxG.width, 25);
    otherText.setFormat(Paths.font("arial.ttf"), 35, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    otherText.alpha = 0;
    otherText.borderSize = 3;
    otherText.screenCenter(FlxAxes.X);
    otherText.text = "Now Playing...";

    songName = new FlxText(-465, otherText.y + 30, FlxG.width, 27);
    songName.setFormat(Paths.font("arial.ttf"), 50, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    songName.borderSize = 3;
    songName.alpha = 0;
    songName.screenCenter(FlxAxes.X);
    songName.text = "SML Movie: " + PlayState.SONG.meta.displayName;

	composerTxt = new FlxText(0, songName.y + 55, FlxG.width, 25);
    composerTxt.setFormat(Paths.font("arial.ttf"), 30, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    composerTxt.borderSize = 3;
    composerTxt.alpha = 0;
    composerTxt.screenCenter(FlxAxes.X);

    for (i in [otherText, songName, composerTxt]) {
		i.cameras = [camInfo];
		add(i);
	}
}

function onEvent(e) {

    if (e.event.name == "Titlecard") {
        composerTxt.text = "Composer(s): " +  e.event.params[0];

        for (i in [otherText, songName, composerTxt]) {
            if (downscroll) 
                FlxTween.tween(i, {alpha: 1, y: i.y + 30}, 0.5, {ease: FlxEase.cubeOut});
            else 
                FlxTween.tween(i, {alpha: 1, y: i.y - 30}, 0.5, {ease: FlxEase.cubeOut});
            
            new FlxTimer().start(e.event.params[1], function(tmr:FlxTimer)
            {
                FlxTween.tween(i, {alpha: 0}, 0.75, {ease: FlxEase.circOut});
            });
        }
    }

}