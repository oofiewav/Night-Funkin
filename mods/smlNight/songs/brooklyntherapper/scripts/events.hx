//

function postCreate() {
    dad.x = 400;
    dad.y = 400;
}

function stepHit(curStep:Int) {
    switch(curStep) {
        case 1834:
            gf.cameraOffset.x = -170;
            FlxTween.tween(camHUD, {alpha: 0}, 1);
    }
}