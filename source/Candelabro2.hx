package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Tiaan
 */
class Candelabro2 extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		loadGraphic(AssetPaths.Candelabro__png, true, 16, 32);
		animation.add("Llama", [0, 1, 2, 3],8, true);
		animation.play("Llama");
	}
	
}