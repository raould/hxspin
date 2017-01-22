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
		updater = new Wiggle();
	}

	override public function update(elapsed:Float):Void {
		updater.update( this, elapsed );
	}
}
