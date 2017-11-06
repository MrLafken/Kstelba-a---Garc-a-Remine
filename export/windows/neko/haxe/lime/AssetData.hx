package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/kstelevel.oel", "assets/data/kstelevel.oel");
			type.set ("assets/data/kstelevel.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Kstelevel.oep", "assets/data/Kstelevel.oep");
			type.set ("assets/data/Kstelevel.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/GloriousPC2-20171020-165453.piskel", "assets/images/GloriousPC2-20171020-165453.piskel");
			type.set ("assets/images/GloriousPC2-20171020-165453.piskel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/gloriousPC2.png", "assets/images/gloriousPC2.png");
			type.set ("assets/images/gloriousPC2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/ps4enemy.png", "assets/images/ps4enemy.png");
			type.set ("assets/images/ps4enemy.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Powah.png", "assets/images/Powah.png");
			type.set ("assets/images/Powah.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Switch-20171027-163731.piskel", "assets/images/Switch-20171027-163731.piskel");
			type.set ("assets/images/Switch-20171027-163731.piskel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/Switch.png", "assets/images/Switch.png");
			type.set ("assets/images/Switch.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Candelabro-20171101-150050.piskel", "assets/images/Candelabro-20171101-150050.piskel");
			type.set ("assets/images/Candelabro-20171101-150050.piskel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/Candelabro.png", "assets/images/Candelabro.png");
			type.set ("assets/images/Candelabro.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/corazon.png", "assets/images/corazon.png");
			type.set ("assets/images/corazon.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/pinche-20171101-155723.piskel", "assets/images/pinche-20171101-155723.piskel");
			type.set ("assets/images/pinche-20171101-155723.piskel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/pinche.png", "assets/images/pinche.png");
			type.set ("assets/images/pinche.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/puentefalso-20171101-162554.piskel", "assets/images/puentefalso-20171101-162554.piskel");
			type.set ("assets/images/puentefalso-20171101-162554.piskel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/puentefalso.png", "assets/images/puentefalso.png");
			type.set ("assets/images/puentefalso.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/xboxpelota.png", "assets/images/xboxpelota.png");
			type.set ("assets/images/xboxpelota.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tileset.png", "assets/images/tileset.png");
			type.set ("assets/images/tileset.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tileset-20171104-230655.piskel", "assets/images/tileset-20171104-230655.piskel");
			type.set ("assets/images/tileset-20171104-230655.piskel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/Powah-20171106-151459.piskel", "assets/images/Powah-20171106-151459.piskel");
			type.set ("assets/images/Powah-20171106-151459.piskel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/images/logo/default.png", "flixel/images/logo/default.png");
			type.set ("flixel/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
