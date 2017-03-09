package com.obfusco.hxspin.sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import com.obfusco.hxspin.Units;
import com.obfusco.hxspin.DB;
import com.obfusco.hxspin.geom.*;

class Person extends FlxSprite
{
	private var side:Side;
	private var armsPosture:ArmsPosture;

	public function new(?X:Pos=0, ?Y:Pos=0)
	{
		super(X, Y);
		this.side = Front;
		this.armsPosture = Middle;
		// todo: support graphics for postures as well as sides.
		loadGraphic(
			DB.g.k.Image_standing_front_path,
			false,
			DB.g.k.Image_standing_width,
			DB.g.k.Image_standing_height
		);
	}

	public function setArmsPosture( armsPosture:ArmsPosture ):Void {
		// todo: update the actual graphic.
		this.armsPosture = armsPosture;
	}

	public function getHandsCXY():HandsPositions {
		// todo: do NOT use arm posture at all, this is at testing hack!
		// instead read hotspots of hands from the image data.
		var mx = x+origin.x;
		var my = y+origin.y;
		switch( armsPosture ) {
			case Up: { my -= 10; }
			case Middle: // nada.
			case Down: { my += 10; }
		}
		var tmpcxy = new CXY<Pixels>( cast( mx, Pixels ), cast( my, Pixels ) );
		return new HandsPositions( tmpcxy, tmpcxy );
	}
}
