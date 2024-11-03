/// DUDEEEE camhud2

function postCreate() {

    FlxG.cameras.add(camHUD2 = new HudCamera(), false);
    camHUD2.bgColor = 0;

    black = new FunkinSprite().makeSolid(FlxG.width, FlxG.height, 0xFF000000);
    black.cameras = [camHUD2];
    black.updateHitbox();
    black.alpha = 1;
    insert(0, black);
}


function stepHit() {
    switch (curStep) {
        case 2:
            FlxTween.tween(black, {alpha: 0}, 7);
        }
}