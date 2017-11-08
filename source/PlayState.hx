package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.util.FlxColor;
import flixel.tile.FlxTilemap;


class PlayState extends FlxState
{
	private var player:Player;
	//private var base:FlxSprite;
	private var base2:FlxSprite;
	private var enemyGroup1:FlxTypedGroup<Enemy1> = new FlxTypedGroup();
	private var powah:FlxSprite;
	private var loader:FlxOgmoLoader;
	private var tilemap:FlxTilemap;
	private var enemyGroup2:FlxTypedGroup<Enemy2> = new FlxTypedGroup();
	private var guide:FlxSprite;
	private var testoVidas:FlxText;
	private var candelabro:FlxTypedGroup<Candelabro> = new FlxTypedGroup();
	private var pinche:FlxTypedGroup<Pinche> = new FlxTypedGroup();
	private var candelabro2:FlxTypedGroup<Candelabro2> = new FlxTypedGroup();
	private var puenteFalso:FlxTypedGroup<PuenteFalso> = new FlxTypedGroup();
	private var corazones:FlxTypedGroup<Corazon> = new FlxTypedGroup();
	private var interfaz:Interfaz;

	
	override public function create():Void
	{
		super.create();
		
		player = new Player (50, 50);
		//powah = new Powah(player.x + player.width, player.y + (player.height / 2));
		//powah.kill();
		guide = new Guia(player.x, player.y);
		guide.visible = false;
		testoVidas = new FlxText(Reg.altoPantalla - 460, Reg.anchoPantalla - 512, 0, "Vidas: " + Reg.vidas, 24, true);
		testoVidas.scrollFactor.set(0, 0);
		//enemy = new Enemy (500, 200);
		
		interfaz = new Interfaz();
		
		
		FlxG.camera.follow(player);
		//powah = new FlxSprite(enemy.width - 5, enemy.height / 2);
		
		//base = new FlxSprite(100,350);
		//base.makeGraphic(440, 32);
		//base.immovable = true;
		//enemy2 = new Enemy2 (240, 200);
		
		loader = new FlxOgmoLoader(AssetPaths.kstelevel__oel);
		tilemap = loader.loadTilemap(AssetPaths.tileset__png,32,32,"Tileset");
		tilemap.setTileProperties(0, FlxObject.NONE);
		tilemap.setTileProperties(1, FlxObject.ANY);
		tilemap.setTileProperties(2, FlxObject.NONE);
		tilemap.setTileProperties(3, FlxObject.NONE);
		tilemap.setTileProperties(4, FlxObject.NONE);
		tilemap.setTileProperties(5, FlxObject.NONE);
		tilemap.setTileProperties(6, FlxObject.NONE);
		tilemap.setTileProperties(7, FlxObject.NONE);
		tilemap.setTileProperties(8, FlxObject.NONE);
		tilemap.setTileProperties(9, FlxObject.NONE);
		tilemap.setTileProperties(10, FlxObject.NONE);
		tilemap.setTileProperties(11, FlxObject.ANY);
		tilemap.setTileProperties(12, FlxObject.ANY);
		tilemap.setTileProperties(13, FlxObject.NONE);
		tilemap.setTileProperties(14, FlxObject.NONE);
		tilemap.setTileProperties(15, FlxObject.NONE);
		tilemap.setTileProperties(16, FlxObject.NONE);
		
		FlxG.worldBounds.set(0, 0, tilemap.width, tilemap.height);
		FlxG.camera.setScrollBounds(0, tilemap.width, 0, tilemap.height);
		
		loader.loadEntities(entityCreator, "Entities");
		
		add(tilemap);
		add(candelabro);
		add(candelabro2);
		add(pinche);
		add(puenteFalso);
		add(player.powah);
		add(player);
		add(guide);
		add(interfaz);
		add(testoVidas);
		add(enemyGroup1);
		add(enemyGroup2);
		add(corazones);
		//add(base);
		//add(enemy);
	}
	
	function entityCreator(entityName:String,entityData:Xml) 
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		
		switch (entityName) 
		{
			case "Ene1":
				var ene1:Enemy1 = new Enemy1(x, y);
				enemyGroup1.add(ene1);
			case "Ene2":
				var ene2:Enemy2 = new Enemy2(x, y);
				enemyGroup2.add(ene2);
			case "Candelabro":
				var cande:Candelabro = new Candelabro(x, y);
				candelabro.add(cande);
			case "Candelabro2":
				var cande2:Candelabro2 = new Candelabro2(x, y);
				candelabro2.add(cande2);
			case "Pinche":
				var pinch:Pinche = new Pinche(x, y);
				pinche.add(pinch);
			case "puentefalso":
				var pf:PuenteFalso = new PuenteFalso(x, y);
				puenteFalso.add(pf);
			case "corazon":
				var cora:Corazon = new Corazon(x, y);
				corazones.add(cora);
			default:
				
		}
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		updateGuia();
		velocidadEnemigos();
		colisionEnemigos2();
		colisionEnemigos1();
		checkVidas();
		candelabros();
		powahmata();
		pinches();
		coras();
		testoVidas.text = "Vidas: " + Reg.vidas; 
		
		
		FlxG.collide(player, tilemap);
		FlxG.collide(enemyGroup2, tilemap);
		
		if (FlxG.collide(player,corazones))
		{
			Reg.vidas ++;
			corazones.kill();
		}
		
	
		if (FlxG.keys.pressed.R) 
		{
			player.reset(50,50);
		}
		
		if (Reg.vidas == 0)
		{
			FlxG.switchState(new GameOver());
		}
		
	}
	
	function coras() 
	{
		
	}
	
	function pinches() 
	{
			if (FlxG.overlap(player,pinche)) 
		{
			player.kill();
			player.powah.kill();
			Reg.vidas --;
			player.reset(50, 50);
		}
	}
	
	function powahmata() 
	{
		var i:Int = 0;
		for (i in 0...enemyGroup1.length) 
		{
			if (FlxG.overlap(player.powah,enemyGroup1.members[i]))
			{
			enemyGroup1.members[i].kill();
			}
		}
		
		i = 0;
		for (i in 0...enemyGroup2.length) 
		{
			if (FlxG.overlap(player.powah,enemyGroup2.members[i]))
			{
			enemyGroup2.members[i].kill();
			}
		}
		
	}
	
	function candelabros() 
	{	
		var i:Int = 0;
		for (i in 0...candelabro.length) 
		{
			if (FlxG.overlap(candelabro.members[i],player.powah)) 
			{
				candelabro.members[i].kill();
			}
		}
		
	}
	
	function checkVidas() 
	{
		switch (Reg.vidas) 
		{
			case 0:
					
			case 1:
			case 2:
			case 3:
			case 4:
			case 5:
			
		}
	}
	
	function velocidadEnemigos() 
	{
		for (i in 0...enemyGroup2.members.length) 
		{
			
			if (enemyGroup2.members[i].x> guide.x+ 256) 
			{
				enemyGroup2.members[i].velocity.x = 0;
			}
			enemyGroup2.members[i].velocity.x = -300;
		}
	}
	
	function updateGuia() 
	{
		guide.x = player.x;
		guide.y = player.y;
		//guide.makeGraphic(80,80,FlxColor.WHITE);
	}
	
	function colisionEnemigos2() 
	{
		if (FlxG.overlap(enemyGroup2,player)) 
		{
			player.kill();
			player.powah.kill();
			Reg.vidas--;
			player.reset(50, 50);
			
		}
	}
	function colisionEnemigos1() 
	{
		if (FlxG.overlap(enemyGroup1,player)) 
		{
			player.kill();
			player.powah.kill();
			Reg.vidas--;
			player.reset(50, 50);
		}
	}
	function bounds()
	{
		var scroll = FlxG.camera.scroll;
		if (player.x> guide.x + Reg.anchoPantalla- player.width) 
		{
			player.x = guide.x + Reg.anchoPantalla - player.width;
		}
		if (player.x> guide.x) 
		{
			player.x = guide.x;
		}
		if (player.y> guide.y + Reg.altoPantalla- player.width) 
		{
			player.y = guide.y + Reg.altoPantalla - player.width;
		}
		if (player.y> guide.y) 
		{
			player.y = guide.y;
		}
		
	}
}