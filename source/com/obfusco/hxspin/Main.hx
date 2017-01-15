package com.obfusco.hxspin;

import flixel.FlxGame;
import openfl.Lib;
import openfl.display.Sprite;

class Main extends Sprite
{
	private static var ops:List<Void->Void> = new List<Void->Void>();
	public static function addOp( op : Void -> Void ) : Void {
		ops.add( op );
	}
	public static function applyOps() : Void {
		for( o in ops ) {
			o();
		}
	}
	
	public function new()
	{
		super();
		var g = new FlxGame(
			0, 0,
			/*todo:MenuState*/PlayState,
			1, 60, 60, true,false
		);
		addChild(g);
	}
}
