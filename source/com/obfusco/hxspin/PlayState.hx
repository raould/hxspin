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
		// this is just here to make things compile, not because it really should be here.
		var t = new Tracker ("assets/music/m1.mp3", 106 );

		bgColor = FlxColor.GREEN;
		
		// todo: abstract these out, too hard-coded in-lined here...

		var p = new Person(K.OffscreenX, K.OffscreenY);
		p.setPosition(
			FlxG.width/2 - p.frameWidth/2,
			FlxG.height - p.frameHeight
		);
		add(p);

		var s = new Sign(K.OffscreenX, K.OffscreenY);
		s.setPosition(
			p.x + p.frameWidth/2 - s.frameWidth/2,

			// todo: instead of hard-coded position by the hands in the
			// image, the player image should have hotspots registered and
			// the sign should be set relative to them. blah.

			p.y + p.frameHeight/2 - s.frameHeight/2 - 20
		);
		add(s);

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
