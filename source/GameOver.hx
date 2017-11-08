package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

/**
 * ...
 * @author ...
 */
class GameOver extends FlxState 
{
	private var texto:FlxText;
	private var restart:FlxButton;

	override public function create():Void 
	{
		super.create();
		texto = new FlxText(0, FlxG.height / 4, 0, "GAME OVER", 30, true);
		texto.screenCenter(X);
		add(texto);
		
		restart = new FlxButton(5,5, "RESTART", restartButton);
		restart.screenCenter();
		add(restart);
		
		
	}
	
	function restartButton():Void
	{
		Reg.vidas = Reg.vidas + 3;
		FlxG.switchState(new Menu());
		
	}
	
}