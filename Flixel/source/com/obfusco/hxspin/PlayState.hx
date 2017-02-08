package com.obfusco.hxspin;

import Sys;
import openfl.Lib;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import com.obfusco.hxspin.Units;
import com.obfusco.hxspin.DB;
import com.obfusco.hxspin.sprites.*;
import com.obfusco.hxspin.spinmode.*;

class PlayState extends FlxState {

	private var person:Person;
	private var sign:Sign; // todo: put this on the player object?
	private var tracker:Tracker;
	private var bgColors:Array<FlxColor>;
	private var bgColorIndex:Int;

	private function nextBgColor():Void {
		bgColor = bgColors[ bgColorIndex ];
		bgColorIndex = (bgColorIndex + 1) % bgColors.length;
	}

	override public function create():Void {
		tracker = new Tracker( DB.g.k.Music_m1_path, DB.g.k.Music_m1_bpm );
		tracker.start();

        // bgColor changing is mostly just for debugging beats, not intended gameplay.
		bgColors = [ FlxColor.RED, FlxColor.BLUE ];
		bgColorIndex = 0;
		nextBgColor();
		
		// todo: abstract these out, too hard-coded in-lined here...

		person = new Person(DB.g.k.OffscreenX, DB.g.k.OffscreenY);
		person.setPosition(
			FlxG.width/2 - person.frameWidth/2,
			FlxG.height - person.frameHeight
		);
		add( person );

		// currently i *do* want us to have to make a new Sign when the song/bpm changes.
		sign = new Sign( tracker, DB.g.k.OffscreenX, DB.g.k.OffscreenY );
		sign.setPosition(
			person.x + person.frameWidth/2 - sign.frameWidth/2,
			// todo: instead of hard-coded position by the hands in the
			// image, the player image should have hotspots registered and
			// the sign should be set relative to them. blah.
			person.y + person.frameHeight/2 - sign.frameHeight/2 - 20
		);
		add( sign );

		super.create();
	}

	override public function update( dt:Seconds ):Void {
		super.update( dt );
		if( Input.isQuitPressed() ) {
			Lib.exit(); // rumor has it this doesn't work on all platforms,
			Sys.exit( 0 ); // hence this backup call to exit.
		}
		if( Input.getPressed() ) {
			sign.trySpinMode( function( t:Tracker ):ISpinMode {
					return new ThrowVertical( sign, t );
				} );
		}
		if( tracker.didBeatHappen() ) {
			nextBgColor();
		}
	}
}
