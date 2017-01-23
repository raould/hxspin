package com.obfusco.hxspin.sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import com.obfusco.hxspin.Units;
import com.obfusco.hxspin.K;
import com.obfusco.hxspin.spinmode.*;

class Sign extends FlxSprite
{
    private var updater:ISpinMode;

	public function new(?X:Pos=0, ?Y:Pos=0) {
		super(X, Y);
		loadGraphic( K.Image_sign_path, false, K.Image_sign_width, K.Image_sign_height );
		// set updater later since x, y here might be offscreen.
	}

	private function getDefaultUpdater():ISpinMode {
		return new Wiggle( this );
	}

	override public function update( dt:Seconds ):Void {
		if( updater == null ) {
			updater = new ThrowVertical( this );
		}
		var done = updater.update( dt );
		if( done ) {
			updater = getDefaultUpdater();
		}
	}
}
