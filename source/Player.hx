package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Tiaan
 */
	enum States
	{
		IDLE;
		RUN;
		JUMP;
		PUNCH;
	}
	
class Player extends FlxSprite 
{
	public var currentState(get, null):States;
	public var powah:Powah;
	public var pega:Bool;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		loadGraphic(AssetPaths.gloriousPC2__png, true, 32, 32);
		setFacingFlip(FlxObject.LEFT, false, false);
		setFacingFlip(FlxObject.RIGHT, true, false);
		animation.add("idle", [3,4,5], 2, true);
		animation.add("run", [0,1,2], 5, true);
		animation.add("jump", [6, 7], 3, false);
		animation.add("punch", [8, 9, 10], 10, false);
		
		powah = new Powah(this.x + this.width, this.y / 2);
		powah.kill();
		/*powah.loadGraphic(AssetPaths.Powah__png, true, 32, 16);	
		animation.add("powah", [0,1,2,3,4], 12,false);*/
		
		scale.set(2, 2);
		
		acceleration.y = 1600;
		currentState = States.IDLE;
		updateHitbox();
	}
	
	override public function update(elapse:Float):Void
	{
		
		stateMachine();
		super.update(elapse);
	}
	
	
	private function stateMachine():Void
	{
		switch (currentState) 
		{
			case States.IDLE:
				animation.play("idle");
				horizontalMovement();
				jump();
				
				if (velocity.x != 0 && velocity.y==0) 
					currentState = States.RUN;
				if (velocity.y != 0) 
					currentState = States.JUMP;
				if (FlxG.keys.justPressed.Z) 
					currentState = States.PUNCH;
					
			case States.JUMP:
				animation.play("jump");
				horizontalMovement();
				
				if (velocity.y == 0)
				{	
					if (velocity.x == 0)
						currentState = States.IDLE;
					else
						currentState = States.RUN;
				}
					if (FlxG.keys.justPressed.Z) 
					currentState = States.PUNCH;
					
			case States.RUN:
				animation.play("run");
				horizontalMovement();
				jump();
				
				if (velocity.x == 0 && velocity.y==0) 
					currentState = States.IDLE;
				if (velocity.y != 0) 
					currentState = States.JUMP;
					
					if (FlxG.keys.justPressed.Z) 
					currentState = States.PUNCH;
					
				
			case States.PUNCH:
				punch();
				
		}
	}
	
	function punch():Void 
	{ 
		
		if (powah.animation.curAnim.curFrame == 4 && powah.animation.finished) 
		{
			currentState = States.IDLE;
			powah.kill();
			powah.animation.reset();
			velocity.x = 300;
		}
		else
		{
			animation.play("punch");
			powah.animation.play("powah");
			velocity.x = 0;
			powah.reset((this.x + this.width), this.y + this.height / 2);
		}
	}
	
	function jump() 
	{
		if (FlxG.keys.justPressed.UP && isTouching(FlxObject.FLOOR))
			{
			velocity.y = -600;
			}
	}
	
	function horizontalMovement() 
	{
		velocity.x = 0;
		
		if (FlxG.keys.pressed.RIGHT) 
			velocity.x += 300;
			powah.x = this.x;
			powah.y = this.y / 2;
			
		if (FlxG.keys.pressed.LEFT) 
			velocity.x -= 300;
			powah.x = this.x - this.width;
			powah.y = this.y / 2;
			
			
		
		if (velocity.x < 0) 
		{
			facing = FlxObject.LEFT;
			powah.facing = FlxObject.LEFT;
			
		}
			if (velocity.x > 0) 
		{
			facing = FlxObject.RIGHT;
			powah.facing = FlxObject.RIGHT;
			
		}
		
	}
	
	
	function get_currentState():States 
	{
		return currentState;
	}
	
}