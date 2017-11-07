package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Enemy extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		loadGraphic(AssetPaths.Switch__png, true, 32, 10);
		animation.add("enemy", [0, 1, 2, 3, 4],8, true);
		animation.play("enemy");
		acceleration.y = 1600;
		scale.set(2, 2);
		
		
		
		updateHitbox();
	}
	
}