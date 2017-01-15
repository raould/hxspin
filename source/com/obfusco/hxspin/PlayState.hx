package com.obfusco.hxspin;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import com.obfusco.hxspin.sprites.*;

class PlayState extends FlxState
{
	override public function create():Void
	{
		bgColor = FlxColor.GREEN;
		add(new FlxText(10, 10, 100, "Hello, World!"));
		var p = new Person(0, 0);
		p.screenCenter();
		add(p);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
