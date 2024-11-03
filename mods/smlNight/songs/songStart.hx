//a

// window stuff too - oofie

function postCreate() {
    camGame.visible = false;
    camHUD.visible = false;
    window.title = "SML Movie: " + SONG.meta.displayName;
}

function onSongStart() {
    camGame.visible = true;
    camHUD.visible = true;
}

function onGamePause() 
    window.title = "SML Movie: The Pause Menu!";
function onSubstateClose() 
    window.title = "SML Movie: " + SONG.meta.displayName;