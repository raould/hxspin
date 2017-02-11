package com.obfusco.hxspin.sprites;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import com.obfusco.hxspin.Units;
import com.obfusco.hxspin.DB;
import com.obfusco.hxspin.*;
import com.obfusco.hxspin.spinmode.*;
import com.obfusco.hxspin.spinmode.ISpinMode;

enum Side {
	Front;
	Back;
}

class Sign extends FlxSprite
{
	private var tracker:Tracker;
	private var updater:ISpinMode;
	private var side:Side;

	public function new(tracker:Tracker, ?X:Pos=0, ?Y:Pos=0) {
		super(X, Y);
		this.tracker = tracker;
		this.side = Front;
		loadSideGraphic();

		// set the 'updater' later since x, y here might be offscreen,
		// which would confuse the updater.

		// todo: er, therefore, maybe make the updaters reset themselves
		// to the current person location when they first start, so the
		// position cathes up? dunno.
	}

	private function getDefaultUpdater():ISpinMode {
		return new FlipVertical( this, tracker );
	}

	// @return false if for whatever reason the given sign mode cannot be started i.e.
	// because 
	public function trySpinMode( fn:Tracker->ISpinMode ):Bool {
		var can = updater != null && updater.interruptable == Interruptable;
		if( can ) {
			updater = fn( tracker );
		}
		return can;
	}

	override public function update( dt:Seconds ):Void {
		if( updater == null ) {
			updater = getDefaultUpdater();
		}
		var done = updater.update( dt );
		switch( done ) {
			case NotRunning: updater = getDefaultUpdater();
			case Running: // no change.
		}
	}

	public function flipSide():Void {
		switch( side ) {
			case Front:	side = Back;
			case Back: side = Front;
		}
		loadSideGraphic();
	}

	private function loadSideGraphic():Void {
		var fga:FlxGraphicAsset;
		switch( side ) {
			case Front: fga = DB.g.k.Image_sign_front_path;
			case Back: fga = DB.g.k.Image_sign_back_path;
		}
		// IIUC, these are cached once loaded.
		loadGraphic(
			fga, 
			false,
			DB.g.k.Image_sign_width,
			DB.g.k.Image_sign_height
		);
	}
}
