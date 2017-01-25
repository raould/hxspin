package com.obfusco.hxspin;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import com.obfusco.hxspin.Units;
import com.obfusco.hxspin.K;
import com.obfusco.hxspin.sprites.*;

class PlayState extends FlxState
{
	private var tracker:Tracker;
	private var bgColors:Array<FlxColor>;
	private var bgColorIndex:Int;

	private function nextBgColor():Void {
		bgColor = bgColors[ bgColorIndex ];
		bgColorIndex = (bgColorIndex + 1) % bgColors.length;
	}

	override public function create():Void
	{
		tracker = new Tracker( K.Music_m1_path, K.Music_m1_bpm );
		tracker.start();
        // bgColor changing is mostly just for debugging beats, not intended gameplay.
		bgColors = [ FlxColor.RED, FlxColor.BLUE ];
		bgColorIndex = 0;
		nextBgColor();
		
		// todo: abstract these out, too hard-coded in-lined here...

		var p = new Person(K.OffscreenX, K.OffscreenY);
		p.setPosition(
			FlxG.width/2 - p.frameWidth/2,
			FlxG.height - p.frameHeight
		);
		add(p);

		// currently i *do* want us to have to make a new Sign when the song/bpm changes.
		var s = new Sign(tracker, K.OffscreenX, K.OffscreenY);
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

	override public function update( dt:Seconds ):Void
	{
		super.update( dt );
		if( tracker.didBeatHappen() ) {
			nextBgColor();
		}
	}
}
