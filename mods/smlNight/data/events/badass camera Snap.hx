//thx axvoidless -abyss
function onEvent(__event)
{
	if (__event.event.name == "badass camera Snap")
	{
		//Logs.trace("badass camera: " + __event.event.params);
		var zoom:Float = __event.event.params[0];
		var rotate:Float = __event.event.params[1];
		var rotateSide:String = __event.event.params[2];

		//tilt left or right
		if (rotateSide)
		{
			rotate = -rotate;
		}
		if (__event.event.params[3]) FlxTween.cancelTweensOf(camGame);
		camGame.angle = rotate;
		defaultCamZoom = zoom;
		FlxG.camera.zoom = defaultCamZoom;
	}
}
