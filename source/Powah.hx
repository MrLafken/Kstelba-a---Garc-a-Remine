package;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Powah extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.Powah__png, true, 32, 16);

		setFacingFlip(FlxObject.RIGHT, false, false);
		setFacingFlip(FlxObject.LEFT, true,false);

		setFacingFlip(FlxObject.RIGHT,false,false);
		setFacingFlip(FlxObject.LEFT, true, false);

		animation.add("powah", [0, 1, 2, 3, 4],10,false);
		animation.play("powah");
		scale.set(1.25, 1.25);
		//acceleration.y = 1600;
		updateHitbox();		
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
	}
}