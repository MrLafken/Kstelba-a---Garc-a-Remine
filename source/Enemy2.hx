package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Enemy2 extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		velocity.x = -300;
		loadGraphic(AssetPaths.xboxpelota__png, true, 32, 32);
		animation.add("Vuelta", [0, 1, 2, 3, 4, 5, 6], 8, true);
		animation.play("Vuelta");
		acceleration.y = 1000;
		scale.set(2, 2);
		
		updateHitbox();
	}
}