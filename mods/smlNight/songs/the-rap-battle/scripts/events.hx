//
import flixel.tweens.FlxTween.FlxTweenType;

var cancelCameraMove:Bool = false;

function beatHit(curBeat:Int) {
    switch(curBeat) {

        case 225:
            dad.cameraOffset.y = 115;
        case 288:
            boyfriend.cameraOffset.y = 115;
    }

    if(curBeat >= 288 && curBeat < 416) {
        FlxG.camera.zoom += 0.095;
		camHUD.zoom += 0.06;
            
    }
}

function stepHit(curStep:Int) {
    switch(curStep) {
        case 110:
            cancelCameraMove = true;
            FlxTween.tween(camFollow, {x: 770}, 1, {ease: FlxEase.sineInOut});
        case 120:
            FlxTween.tween(camHUD, {alpha: 0.5}, 0.2);
        case 128:
            cancelCameraMove = false;
            gf.cameraOffset.x = -170;
            camera.followLerp = 0.05;
        case 130:
            FlxTween.tween(camHUD, {alpha: 1}, 0.2);
        case 1670:
            FlxTween.tween(camHUD, {alpha: 0}, 1);
    }
}

function onCameraMove(e) if(cancelCameraMove) e.cancel();