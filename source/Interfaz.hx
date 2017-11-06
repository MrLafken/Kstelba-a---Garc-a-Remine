package;

import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class Interfaz extends FlxTypedGroup<FlxSprite>
{
	private var interfaz:FlxSprite;
	private var relleno:FlxSprite;
	private var vidas:FlxText;

	public function new() 
	{
		super();
		
		interfaz = new FlxSprite(0, 0);
		relleno = new FlxSprite();
		relleno.makeGraphic(FlxG.width - 2, 30, FlxColor.BLACK);
		interfaz.makeGraphic(FlxG.width, 32, FlxColor.RED);
		interfaz.stamp(relleno, 1, 1);
		interfaz.scrollFactor.set(0, 0);
		
		
		
		add(interfaz);
		
	}
	
}