package com.obfusco.hxspin.sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Sign extends FlxSprite
{
	public function new(?X:Float=0, ?Y:Float=0)
	{
		super(X, Y);
		// todo: i wish it would just use the resolution from the image itself?!
		loadGraphic( "assets/images/sign1.png", false, 186, 54 );
	}

	override public function update(elapsed:Float):Void
	{
		angle += 100 * elapsed;
	}
}
