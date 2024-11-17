//a

// window stuff too - oofie

function postCreate() {
	camGame.visible = false;
	
    camHUD.alpha = 0;
	FlxTween.tween(camHUD, {alpha: 1}, 1.0, {ease: FlxEase.quadInOut});
	
    window.title = "SML Movie: " + SONG.meta.displayName;
}

function onSongStart() {
    camGame.visible = true;
}

function onGamePause() 
    window.title = "SML Movie: The Pause Menu!";
function onSubstateClose() 
    window.title = "SML Movie: " + SONG.meta.displayName;