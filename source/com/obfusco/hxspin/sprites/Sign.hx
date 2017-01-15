package com.obfusco.hxspin.sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Sign extends FlxSprite
{
	private static inline var MaxRotDegrees = 30;
	private static inline var MinRotDegrees = -30;
	private var degreesPerSecond = 100;

	public function new(?X:Float=0, ?Y:Float=0)
	{
		super(X, Y);
		// todo: i wish it would just use the resolution from the image itself?!
		loadGraphic( "assets/images/sign1.png", false, 186, 54 );
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
