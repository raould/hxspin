package com.obfusco.hxspin.sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import com.obfusco.hxspin.Units;
import com.obfusco.hxspin.DB;
import com.obfusco.hxspin.geom.*;

class Person extends FlxSprite
{
	private var side:Side;
	private var posture:Posture;

	public function new(?X:Pos=0, ?Y:Pos=0)
	{
		super(X, Y);
		this.side = Front;
		this.posture = ArmsMiddle;
		loadGraphic(
			DB.g.k.Image_standing_front_path,
			false,
			DB.g.k.Image_standing_width,
			DB.g.k.Image_standing_height
		);
	}

	public function setPosture( posture:Posture ):Void {
		this.posture = posture;
		// todo: update the actual graphic.
	}

	public function getHandsCXY():HandsPositions {
		// todo: e.g. read hotspots of hands from the image data,
		// which means it changes based on posture.
		return new HandsPositions(
			new CXY<Pixels>( cast( x, Pixels ), cast( y, Pixels ) ),
			new CXY<Pixels>( cast( x, Pixels ), cast( y, Pixels ) )
		);
	}
}
