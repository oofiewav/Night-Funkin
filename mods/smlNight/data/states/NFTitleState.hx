import funkin.editors.ui.UIState;

static var initialized:Bool = false;
var pressedEnter:Bool = false;
var transitioning:Bool = false;

var ngSpr:FlxSprite;
var titleText:FlxSprite;

var curWacky:Array<String> = [];
var textGroup:FlxGroup;

function new() if (FlxG.sound.music == null || !FlxG.sound.music.playing) CoolUtil.playMenuSong();

function create() { 

    textGroup = new FlxGroup();

    logo = new FunkinSprite(20, -350).loadGraphic(Paths.image('menus/titlescreen/sml_logo'));
    logo.updateHitbox();
    logo.screenCenter();
    add(logo);

    titleText = new FlxSprite(100, 576);
	titleText.frames = Paths.getSparrowAtlas('menus/titlescreen/titleEnter');
	titleText.animation.addByPrefix('idle', "Press Enter to Begin", 24);
	titleText.animation.addByPrefix('press', "ENTER PRESSED", 24);
	titleText.antialiasing = true;
	titleText.animation.play('idle');
	titleText.updateHitbox();
	add(titleText);

    var stupidArray:Array<String> = CoolUtil.coolTextFile(Paths.txt('titlescreen/introText'));
	if (stupidArray.contains('')) stupidArray.remove('');
	curWacky = stupidArray[FlxG.random.int(0, stupidArray.length-1)].split('--');

    if (initialized){
        skipIntro();
    }else{
        initialized = true;
    }

        
	textyBG = new FunkinSprite().makeSolid(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
	textyBG.screenCenter();
	add(textyBG);

    add(textGroup);
}

function update() {
	if (controls.ACCEPT && !skippedIntro) skipIntro();

	else if (controls.ACCEPT && skippedIntro && !pressedEnter){

        FlxG.camera.flash(FlxColor.WHITE, 1);

        titleText.animation.play('press');
        CoolUtil.playMenuSFX(1);

        pressedEnter = transitioning = true;

        new FlxTimer().start(1.5, function() {
            FlxG.switchState(new UIState(true, "NFMenuState"));
		});
        } else if (controls.ACCEPT && transitioning){
            FlxG.camera.stopFX();
            FlxG.switchState(new MainMenuState());
        }
    
}

function createCoolText(textArray:Array<String>) {
	for (i => text in textArray) {
		if (text == "" || text == null) continue;
        var money:Alphabet = new Alphabet(0, (i * 60) + 200, text, true, false);
        money.screenCenter(FlxAxes.X);
        textGroup.add(money);
	}
}

function addMoreText(text:String) {
    var coolText:Alphabet = new Alphabet(0, (textGroup.length * 60) + 200, text, true, false);
    coolText.screenCenter(FlxAxes.X);
    textGroup.add(coolText);
}

function deleteCoolText() {
	while (textGroup.members.length > 0) {
		textGroup.members[0].destroy();
		textGroup.remove(textGroup.members[0], true);
	}
}

function beatHit() {
    logo.scale.set(0.85, 0.85);
    FlxTween.tween(logo.scale, {x: 0.8, y: 0.8}, 0.4, {ease: FlxEase.quadOut});

    if(skippedIntro) return;
	switch (curBeat)
	{
        case 1:		createCoolText(['The Night Funkin Team']);
        case 3:		addMoreText('presents');
        case 4:		deleteCoolText();
        case 5:		createCoolText(['not in association with']);
        case 6:		addMoreText('SML');
        case 7:		ngSpr.visible = true;
        case 8:		deleteCoolText(); ngSpr.visible = false;
        case 9:		createCoolText([curWacky[0]]);
        case 11:	addMoreText(curWacky[1]);
        case 12:	deleteCoolText();
        case 13:	addMoreText('SML MOVIE');
        case 14:	addMoreText('Night');
        case 15:	
            addMoreText('Funkin');
        case 16:	
            skipIntro();
	}
}

var skippedIntro:Bool = false;

function skipIntro() {
	if (!skippedIntro) {
        textyBG.visible = false;
        FlxG.camera.flash(FlxColor.WHITE, 1);
        remove(textGroup);
        add(titleText);
        skippedIntro = true;
    }
}