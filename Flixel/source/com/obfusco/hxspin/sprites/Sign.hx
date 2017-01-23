package com.obfusco.hxspin.sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import com.obfusco.hxspin.K;
import com.obfusco.hxspin.spinmode.*;

class Sign extends FlxSprite
{
    private var updater:ISpinMode;

	public function new(?X:Float=0, ?Y:Float=0) {
		super(X, Y);
		loadGraphic( K.Image_sign_path, false, K.Image_sign_width, K.Image_sign_height );
		// set updater later since x, y here might be offscreen.
	}

	private function defaultUpdater():Void {
		updater = new Wiggle( this );
	}

	override public function update( elapsed:Float ):Void {
		if( updater == null ) {
			updater = new ThrowVertical( this );
		}
		var done = updater.update( elapsed );
/*
		if( done ) {
			defaultUpdater();
		}
*/
	}
}
