package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

/**
 * ...
 * @author ...
 */
class Menu extends FlxState 
{
	private var play:FlxButton;
	private var texto:FlxText;
	private var player:FlxSprite;

	override public function create():Void 
	{
		super.create();
		
		texto = new FlxText(0, FlxG.height / 4, 0, "KSTELBAÑA", 12, true);
		texto.screenCenter(X);
		add(texto);
		
		play = new FlxButton(0, 0, "JUGAR", ponePlay);
		play.screenCenter();
		add(play);
		
		player = new FlxSprite(Reg.altoPantalla -70,Reg.anchoPantalla-120);
		player.loadGraphic(AssetPaths.gloriousPC2__png, true, 32, 32);
		player.animation.add("idle", [3, 4, 5], 5, true);
		player.animation.play("idle");
		player.scale.set(12, 12);
		add(player);
	}
	
	private function ponePlay():Void
	{
		FlxG.switchState(new PlayState());
	}
	
}