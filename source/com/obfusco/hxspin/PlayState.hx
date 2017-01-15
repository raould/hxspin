package com.obfusco.hxspin;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import com.obfusco.hxspin.K;
import com.obfusco.hxspin.sprites.*;

class PlayState extends FlxState
{
	override public function create():Void
	{
		bgColor = FlxColor.GREEN;
		
		var p = new Person(K.OffscreenX, K.OffscreenY);
		p.setPosition( FlxG.width/2 - p.frameWidth/2, FlxG.height - p.frameHeight );
		add(p);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
