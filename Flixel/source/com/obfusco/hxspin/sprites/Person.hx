package com.obfusco.hxspin.sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import com.obfusco.hxspin.Units;
import com.obfusco.hxspin.DB;

class Person extends FlxSprite
{
	public function new(?X:Pos=0, ?Y:Pos=0)
	{
		super(X, Y);
		loadGraphic(
			DB.g.k.Image_standing_path,
			false,
			// todo: blah, should not be casting, really, i guess,
			// should have a Units types that is integers?
			Std.int(DB.g.k.Image_standing_width),
			Std.int(DB.g.k.Image_standing_height)
		);
	}
}
