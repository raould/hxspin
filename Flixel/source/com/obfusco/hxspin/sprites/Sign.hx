package com.obfusco.hxspin.sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import com.obfusco.hxspin.K;

class Sign extends FlxSprite
{
	private static inline var MaxRotDegrees = 30;
	private static inline var MinRotDegrees = -30;
	private var degreesPerSecond = 100;

	public function new(?X:Float=0, ?Y:Float=0)
	{
		super(X, Y);
		loadGraphic( K.Image_sign_path, false, K.Image_sign_width, K.Image_sign_height );
	}

	override public function update(elapsed:Float):Void
	{
		// todo: software rotation is purportedly 10x slower than rotation via tilesheet frames.
		// todo: animate the player at least a little and match them up.
		angle += degreesPerSecond * elapsed;
		if( degreesPerSecond > 0 && angle > MaxRotDegrees )
		{
			degreesPerSecond *= -1;
		}
		else if( degreesPerSecond < 0 && angle < MinRotDegrees )
		{
			degreesPerSecond *= -1;			
		}
	}
}
