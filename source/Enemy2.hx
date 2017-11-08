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
		loadGraphic(AssetPaths.xboxpelota__png, true, 32, 32);
		animation.add("Vuelta", [0, 1, 2, 3, 4, 5, 6], 8, true);
		animation.play("Vuelta");
		scale.set(2, 2);
		
		velocity.x = 0;
		velocity.y = 0;
		
		
		updateHitbox();
	}
	
	override public function update(elapse:Float):Void
	{
		super.update(elapse);
		
		if (isOnScreen()) 
		{
			movimiento();
		}
	}
	
	public function movimiento() 
	{
		velocity.x = -300;
	}
	
	
}