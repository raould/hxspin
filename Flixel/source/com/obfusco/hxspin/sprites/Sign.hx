package com.obfusco.hxspin.sprites;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import com.obfusco.hxspin.Units;
import com.obfusco.hxspin.DB;
import com.obfusco.hxspin.*;
import com.obfusco.hxspin.spinmode.*;

class Sign extends FlxSprite
{
	private var tracker:Tracker;
	private var updater:ISpinMode;
	private var isFront:Bool; // front or back visible

	public function new(tracker:Tracker, ?X:Pos=0, ?Y:Pos=0) {
		super(X, Y);
		this.tracker = tracker;
		this.isFront = true;
		loadGraphic(
			DB.g.k.Image_sign_front_path,
			false,
			// todo: blah, should not be casting, really, i guess,
			// should have a Units types that is integers?
			Std.int(DB.g.k.Image_sign_width),
			Std.int(DB.g.k.Image_sign_height)
		);
		// set updater later since x, y here might be offscreen.
	}

	private function getRandomUpdater():ISpinMode {
		var i:Int = FlxG.random.int(1, 4);
		switch (i) {
			case 1:
				return new ThrowVertical( this, tracker );
			case 2:
				return new FlipVertical( this, tracker );
			case 3:
				return new FlipHorizontal( this, tracker );
			case 4:
				return new Wiggle( this, tracker );
		}
		return new Wiggle( this, tracker );
	}

	private function getDefaultUpdater():ISpinMode {
		return new Wiggle( this, tracker );
	}

	// @return false if for whatever reason the given sign mode cannot be started i.e.
	// because 
	public function trySpinMode( fn:Tracker->ISpinMode ):Bool {
		var can = updater != null && updater.isExclusive == false;
		if( can ) {
			updater = fn( tracker );
		}
		return can;
	}

	override public function update( dt:Seconds ):Void {
		if( updater == null ) {
			//updater = new ThrowVertical( this, tracker );
			updater = new FlipVertical( this, tracker );
			//updater = new FlipHorizontal( this, tracker );
			//updater = new Wiggle( this, tracker );
			//updater = getDefaultUpdater();
		}
		var done = updater.update( dt );
		if( done ) {
			updater = getDefaultUpdater();
		}
	}



	public function flip():Void {
		// Flip sign.
		isFront = !isFront;
		var fga:FlxGraphicAsset = isFront ? DB.g.k.Image_sign_front_path : DB.g.k.Image_sign_back_path;

		// IIUC, these are cached once loaded.
		loadGraphic(
			fga, 
			false,
			Std.int(DB.g.k.Image_sign_width),
			Std.int(DB.g.k.Image_sign_height)
		);
	}
}
