package com.obfusco.hxspin.sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Person extends FlxSprite
{
	public function new(?X:Float=0, ?Y:Float=0)
	{
		super(X, Y);
		// todo: i wish it would just use the resolution from the image itself.
		loadGraphic( "assets/images/standing.png", false, 96, 192 );
	}
}
