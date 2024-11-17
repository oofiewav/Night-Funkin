///boiii
function stepHit(curStep: Int) {
	switch(curStep) {
		case 1:
			FlxTween.tween(camGame, {zoom: 1.95}, (Conductor.stepCrochet/500) * 10, {ease:FlxEase.quadInOut});
		case 16:
			defaultCamZoom = 1.95;
			FlxTween.tween(dad, {alpha: 1}, 1);
			FlxTween.tween(light, {alpha: 0.5}, 0.5);
		case 1056:
			defaultCamZoom = 2.05;
		case 1064:
			dad.alpha = 0;
			light.alpha = 0;
			defaultCamZoom = 1.05;

	}
}