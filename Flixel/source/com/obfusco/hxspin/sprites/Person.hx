package com.obfusco.hxspin.sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import com.obfusco.hxspin.K;

class Person extends FlxSprite
{
	public function new(?X:Float=0, ?Y:Float=0)
	{
		super(X, Y);
		loadGraphic( K.Image_standing_path, false, K.Image_standing_width, K.Image_standing_height );
	}
}
