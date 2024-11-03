import flixel.FlxG;
import flixel.FlxObject;
import funkin.options.OptionsMenu;
import funkin.editors.EditorPicker;
import funkin.menus.credits.CreditsMain;
import funkin.editors.ui.UIState;

import funkin.editors.ui.UIText;
import funkin.editors.ui.UITextBox;

import funkin.backend.utils.DiscordUtil;

var camFollowPos:FlxObject;
var inCredits:Bool = false;

//image names lol
var storyModeSongs:Array<String> = ['the-rap-battle', 'brooklyntherapper', 'chef-pee-pee'];
var freeplaySongs:Array<String> = ['cowards-edge'];
// either i put these together or WHATEVER
var storyModeGRP:FlxTypedGroup<FlxText>;
var freeplayGRP:FlxTypedGroup<FlxText>;

var codes:Map<String, String> = [
	"Bugged Flaws" => "jeffy-error",
    //"Rusted Coin" => "lucky-day",
    //"Uncanny Sitcom" => "charleyy-special-guest",
];
var field:UITextBox;

// i might put this in a dynamic array
var creditPeeps:String = "WaXen - Creator of the Mod\nLexodiuS - Lead Coder, Director, Composer\nCorperator - Co-Director, Composer\nTangleMango - Composer\nSanterLmao - Artist\nTRSF - Lead Musician, Secondary Coder\nOofie - Third Coder\nGreystorm - Composed Brooklyn Guy's Song\nCharleyyyfan - Animator\nSergi - Artist\nZigos - Artist";

function create() {
    if (FlxG.sound.music != null)
		FlxG.sound.music.play();

    FlxG.mouse.visible = true;

    DiscordUtil.changePresence('Scrolling Through Menus...', "Main Menu");
    CoolUtil.playMenuSong();

    camFollowPos = new FlxObject(0, 0, 1, 1);
    add(camFollowPos);

    camFollowPos.setPosition(640, -40);
    FlxG.camera.follow(camFollowPos, null, 1);

	bg = new FunkinSprite().makeSolid(FlxG.width * 3, FlxG.height * 3, FlxColor.WHITE);
	bg.screenCenter();
	add(bg);

    header = new FunkinSprite(20, -350).loadGraphic(Paths.image('menus/ytMenu/header2'));
    header.scale.set(0.9, 0.9);
    header.antialiasing = true;
    header.updateHitbox();
    add(header);

    stateText = new FunkinText(35, 103, FlxG.width, "Main Menu");
	stateText.setFormat(Paths.font("robotoNormal.ttf"), 20, FlxColor.BLACK, 'left');
    stateText.antialiasing = true;
	add(stateText);

    optionsTxt = new FunkinText(170, 100, FlxG.width, "Options");
	optionsTxt.setFormat(Paths.font("robotoNormal.ttf"), 20, FlxColor.BLACK, 'left');
    optionsTxt.updateHitbox();
    optionsTxt.alpha = 0.5;
    optionsTxt.antialiasing = true;
	add(optionsTxt);

    creditxt = new FunkinText(270, 100, FlxG.width, "Credits");
	creditxt.setFormat(Paths.font("robotoNormal.ttf"), 20, FlxColor.BLACK, 'left');
    creditxt.alpha = 0.5;
    creditxt.antialiasing = true;
    creditxt.updateHitbox();
	add(creditxt);


    line = new FunkinSprite(35, stateText.y + 43).makeSolid(100, 3.5, FlxColor.BLACK);
    add(line);

    storyModeTxt = new FunkinText(35, 180, FlxG.width, "Story Mode");
	storyModeTxt.setFormat(Paths.font("robotoNormal.ttf"), 30, FlxColor.BLACK, 'left');
    storyModeTxt.antialiasing = true;
	add(storyModeTxt);

    line2 = new FunkinSprite(0, 150).makeSolid(1280, 1, FlxColor.GRAY);
    add(line2);

    line3 = new FunkinSprite(0, 490).makeSolid(1280, 1, FlxColor.GRAY);
    add(line3);

    add(storyModeGRP = new FlxTypedGroup(4));

    for (i in 0...storyModeSongs.length) {
        var stuff = new FunkinSprite(35, 250).loadGraphic(Paths.image('menus/ytMenu/thumbnails/' + storyModeSongs[i]));
        stuff.scale.set(0.2, 0.2);
        stuff.ID = i;
        stuff.updateHitbox();
        storyModeGRP.add(stuff);
    }
    storyModeGRP.members[1].x = 295;
    storyModeGRP.members[2].x = 555;

    // hitboxes since updatehitbox() is being a bitch
    hitbox1 = new FunkinSprite(35, 250).makeSolid(255, 200, FlxColor.BLACK);
    hitbox1.alpha = 0.0001;
    add(hitbox1);

    hitbox2 = new FunkinSprite(295, 250).makeSolid(255, 200, FlxColor.BLACK);
    hitbox2.alpha = 0.0001;
    add(hitbox2);

    hitbox3 = new FunkinSprite(555, 250).makeSolid(255, 200, FlxColor.BLACK);
    hitbox3.alpha = 0.0001;
    add(hitbox3);

    rapBattleText = new FunkinText(35, storyModeGRP.members[0].y + 150, FlxG.width, "SML Movie: The Rap\nBattle!");
	rapBattleText.setFormat(Paths.font("robotoRegular.ttf"), 20, FlxColor.BLACK, 'left');
    rapBattleText.antialiasing = true;
	add(rapBattleText);

    rapperText = new FunkinText(300, storyModeGRP.members[1].y + 150, FlxG.width, "SML Movie: Brooklyn Guy\nThe Rapper!");
	rapperText.setFormat(Paths.font("robotoRegular.ttf"), 20, FlxColor.BLACK, 'left');
    rapperText.antialiasing = true;
	add(rapperText);
    
    peepeeText = new FunkinText(555, storyModeGRP.members[2].y + 150, FlxG.width, "SML Movie: Chef Pee Pee's\nHit Single!");
	peepeeText.setFormat(Paths.font("robotoRegular.ttf"), 20, FlxColor.BLACK, 'left');
    peepeeText.antialiasing = true;
	add(peepeeText);

    freeplayTxt = new FunkinText(35, 530, FlxG.width, "Freeplay");
	freeplayTxt.setFormat(Paths.font("robotoNormal.ttf"), 30, FlxColor.BLACK, 'left');
    freeplayTxt.antialiasing = true;
	add(freeplayTxt);

    add(freeplayGRP = new FlxTypedGroup(4));

    for (i in 0...freeplaySongs.length) {
        var freeplayStuff = new FunkinSprite(35, 600).loadGraphic(Paths.image('menus/ytMenu/thumbnails/' + freeplaySongs[i]));
        freeplayStuff.scale.set(0.2, 0.2);
        freeplayStuff.ID = i;
        freeplayStuff.updateHitbox();
        freeplayGRP.add(freeplayStuff);
    }

    hitbox4 = new FunkinSprite(35, 600).makeSolid(255, 200, FlxColor.BLACK);
    hitbox4.alpha = 0.0001;
    add(hitbox4);

    edgingText = new FunkinText(35, freeplayGRP.members[0].y + 150, FlxG.width, "SML Movie: The Cowards\nEdge!");
	edgingText.setFormat(Paths.font("robotoRegular.ttf"), 20, FlxColor.BLACK, 'left');
    edgingText.antialiasing = true;
	add(edgingText);
        
    field = new UITextBox(340, -390, searchEntry, 650, 28, false);
	field.multiline = false;
	field.label.setFormat(Paths.font("robotoRegular.ttf"), 23, 0xFF000000);
	field.caretSpr.color = FlxColor.BLACK;
	field.caretSpr.scale.set(1, 25);
	field.caretSpr.offset.set(0, -16);
	field.antialiasing = true;
	add(field);

    // stuff
    creditsHeader = new FunkinText(35, 350, FlxG.width, "Credits");
	creditsHeader.setFormat(Paths.font("robotoNormal.ttf"), 20, FlxColor.BLACK, 'left');
    creditsHeader.antialiasing = true;
    creditsHeader.visible = false;
	add(creditsHeader);

    mainCreditsTxt = new FunkinText(35, creditsHeader.y + 45, FlxG.width, creditPeeps);
	mainCreditsTxt.setFormat(Paths.font("robotoRegular.ttf"), 20, FlxColor.BLACK, 'left');
    mainCreditsTxt.antialiasing = true;
    mainCreditsTxt.visible = false;
	add(mainCreditsTxt);
}

function update(elapsed:Float) {

    if (FlxG.keys.justPressed.SEVEN) {
        persistentUpdate = false;
        persistentDraw = true;
        openSubState(new EditorPicker());
    }
    
    if(controls.ACCEPT) {
        codeDecide();
    }

    if(FlxG.mouse.overlaps(hitbox1) && FlxG.mouse.pressed && !inCredits) {
        PlayState.loadSong("the-rap-battle", "hard", false, false);
        FlxG.switchState(new PlayState());
    }

    if(FlxG.mouse.overlaps(hitbox2) && FlxG.mouse.pressed && !inCredits) {
        PlayState.loadSong("brooklyntherapper", "hard", false, false);
        FlxG.switchState(new PlayState());
    }

    if(FlxG.mouse.overlaps(hitbox3) && FlxG.mouse.pressed && !inCredits) {
        PlayState.loadSong("chef-pee-pee", "hard", false, false);
        FlxG.switchState(new PlayState());
    }

    if(FlxG.mouse.overlaps(hitbox4) && FlxG.mouse.pressed && !inCredits) {
        PlayState.loadSong("cowards-edge", "hard", false, false);
        FlxG.switchState(new PlayState());
    }

    
    if(FlxG.keys.justPressed.C) {
        inCredits = !inCredits;
    }

    if (FlxG.mouse.wheel < 0)
        camFollowPos.y  += 40;
    if (FlxG.mouse.wheel > 0)
        camFollowPos.y  -= 40;

    if(camFollowPos.y < -40)
        camFollowPos.y = -40;

    if(500 < camFollowPos.y)
        camFollowPos.y = 500;

    // credits stuff goes here

    if(inCredits) {
        for(i in [freeplayGRP, storyModeGRP, rapBattleText, rapperText, peepeeText, edgingText, storyModeTxt, freeplayTxt, line3])
            i.visible = false;

            creditsHeader.visible = true;
            mainCreditsTxt.visible = true;
    } else {
        for(i in [freeplayGRP, storyModeGRP, rapBattleText, rapperText, peepeeText, edgingText, storyModeTxt, freeplayTxt, line3])
            i.visible = true;
            creditsHeader.visible = false;
            mainCreditsTxt.visible = false;
    }

}

function codeDecide() {
    if (codes[field.label.text] != null) {
		codeFound(field.label.text);
	}
}

function codeFound(code:String) {
    searchStateEntry = code;

    PlayState.loadSong(codes[code], "hard");
    FlxG.switchState(new PlayState());
}