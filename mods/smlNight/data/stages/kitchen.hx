import flixel.util.FlxStringUtil;
import flixel.text.FlxTextBorderStyle;

function create() {
    timeTxt = new FunkinText(230, 460, FlxG.width, "X:XX");
    timeTxt.setFormat(Paths.font("vcr.ttf"), 60, FlxColor.GREEN, 'LEFT', FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    timeTxt.angle = -5;
    timeTxt.borderSize = 2;
    timeTxt.cameras = [camGame];
    insert(2, timeTxt);
}

function update(elapsed:Float) {
    var pos = Math.max(Conductor.songPosition, 0);
    var timeNow = Math.floor(pos / 60000) + ":" + CoolUtil.addZeros(Std.string(Math.floor(pos / 1000) % 60), 2);
    var length = Math.floor(inst.length / 60000) + ":" + CoolUtil.addZeros(Std.string(Math.floor(inst.length / 1000) % 60), 2); 

    timeTxt.text = timeNow;
}