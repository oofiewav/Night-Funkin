import flixel.text.FlxTextBorderStyle;
import flixel.text.FlxTextFormat;
import flixel.text.FlxTextFormatMarkerPair;

var lyric:FlxText;

var camlyric:FlxCamera = new FlxCamera();
camlyric.bgColor = 0x00000000;
FlxG.cameras.add(camlyric, false);

function create() {
    lyric = new FlxText(0, 600, FlxG.width, 25);
    lyric.setFormat(Paths.font("arial.ttf"), 35, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    lyric.alpha = 0;
    lyric.borderSize = 3;
    lyric.screenCenter(FlxAxes.X);
	lyric.cameras = [camlyric];
    lyric.text = "fart";
	insert(0, lyric);
}

function onEvent(e) {
    if (e.event.name == "Lyrice") {
        lyric.text = e.event.params[0];
		
		if (e.event.params[1] == true) {
			lyric.alpha = 1;
		}
		
		if (e.event.params[1] == false) {
			lyric.alpha = 0;
		}
	}
}