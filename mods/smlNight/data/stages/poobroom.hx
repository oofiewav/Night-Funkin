//s

var blackbar:FlxSprite;
var room:FlxSprite;
var blackbar2:FlxSprite;

function create() {
    defaultCamZoom = 1.15;
    boyfriend.scale.set(0, 0);
    dad.x -= 15;
    dad.y += 187;
    dad.cameraOffset.x = -133;

    room = new FlxSprite(-25, -186).loadGraphic(Paths.image("stages/poobroom/poobroom"));
    room.antialiasing = true;
    room.scale.set(0.7, 0.7);
    insert(0, room);

    blackbar = new FlxSprite(-389, 0).makeSolid(800, 1500, FlxColor.BLACK);
    blackbar.cameras = [camHUD];
    insert(1, blackbar);

    blackbar2 = new FlxSprite(930, 0).makeSolid(800, 1500, FlxColor.BLACK);
    blackbar2.cameras = [camHUD];
    insert(1, blackbar2);
}