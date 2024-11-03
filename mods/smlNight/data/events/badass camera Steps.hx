//thx axvoidless -abyss
function onEvent(__event)
{
	if (__event.event.name == "badass camera Steps")
	{
		//Logs.trace("badass camera: " + __event.event.params);
		var zoom:Float = __event.event.params[0];
		var rotate:Float = __event.event.params[1];
		var rotateSide:String = __event.event.params[2];
		var steps:Float = __event.event.params[3];
		var ease:String = __event.event.params[4];
		var dir:String = __event.event.params[5];

		//lastIndexOf(x:T, ?fromIndex:Int):Int
		var easeDirection:FlxEase;

		if (ease == 'linear')
		{
			FlxEase.linear;
		}
		else
		{
			switch (dir)
			{
				case 'In':
					switch (ease)
					{
						case 'sine': easeDirection = FlxEase.sineIn;
						case 'quad': easeDirection = FlxEase.quadIn;
						case 'cube': easeDirection = FlxEase.cubeIn;
						case 'quart': easeDirection = FlxEase.quartIn;
						case 'quint': easeDirection = FlxEase.quintIn;
						case 'expo': easeDirection = FlxEase.expoIn;
						case 'back': easeDirection = FlxEase.backIn;
						case 'elastic': easeDirection = FlxEase.elasticIn;
						case 'bounce': easeDirection = FlxEase.bounceIn;
						case 'circ': easeDirection = FlxEase.circOut;
					}
					
				case 'Out':
					//trace(ease);
					switch (ease)
					{ 
						case 'sine': easeDirection = FlxEase.sineOut;
						case 'quad': easeDirection = FlxEase.quadOut;
						case 'cube': easeDirection = FlxEase.cubeOut;		
						case 'quart': easeDirection = FlxEase.quartOut;
						case 'quint': easeDirection = FlxEase.quintOut;
						case 'expo': easeDirection = FlxEase.expoOut;
						case 'back': easeDirection = FlxEase.backOut;
						case 'elastic': easeDirection = FlxEase.elasticOut;
						case 'circ': easeDirection = FlxEase.circOut;
					}

				case 'InOut':
					switch (ease)
					{ 
						case 'sine': easeDirection = FlxEase.sineInOut;
						case 'quad': easeDirection = FlxEase.quadInOut;
						case 'cube': easeDirection = FlxEase.cubeInOut;
						case 'quart': easeDirection = FlxEase.quartInOut;
						case 'quint': easeDirection = FlxEase.quintInOut;
						case 'expo': easeDirection = FlxEase.expoInOut;
						case 'back': easeDirection = FlxEase.backInOut;
						case 'elastic': easeDirection = FlxEase.elasticInOut;
						case 'bounce': easeDirection =  FlxEase.bounceInOut;
						case 'circ': easeDirection = FlxEase.circOut;
					}
			}
		}


		//tilt left or right
		if (rotateSide)
		{
			rotate = -rotate;
		}

		//trace(easeDirection);
		FlxTween.cancelTweensOf(camGame);
		FlxTween.tween(camGame, {angle: rotate}, (Conductor.stepCrochet / 1000) * steps - 0.001, {ease: easeDirection});
		FlxTween.tween(camGame, {zoom: zoom}, (Conductor.stepCrochet / 1000) * steps - 0.001, {ease: easeDirection, onUpdate: function(value) {defaultCamZoom = FlxG.camera.zoom;}});
	}
}
