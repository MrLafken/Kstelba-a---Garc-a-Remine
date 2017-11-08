package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

/**
 * ...
 * @author ...
 */
class Enemy1 extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		loadGraphic(AssetPaths.Switch__png, true, 32, 10);
		animation.add("Vuelo", [0, 1, 2, 3, 4],8, true);
		animation.play("Vuelo");
		//velocity.x = -300;
		//velocity.y = -100;
		//acceleration.y = 1600;
		scale.set(2.5, 2.5);
		
		var v = y + 25;
		FlxTween.tween(this, {y : v}, 0.5, {type:FlxTween.PINGPONG, ease: FlxEase.sineInOut});
		
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
	
	function movimiento():Void 
	{
		velocity.x = -100;
	
	}
	
}