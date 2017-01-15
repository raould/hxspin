package com.obfusco.hxspin.sprites;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Person extends FlxSprite
{
	public function new(?X:Float=0, ?Y:Float=0)
	{
		super(X, Y);
		makeGraphic( 16, 32, FlxColor.BLUE );
	}
}
