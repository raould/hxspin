package com.obfusco.hxspin;

import com.obfusco.hxspin.Units;

class K/*onstants*/ {

	public function new() {}

	// i hate haxe?! i just want these to be 'final' instance fields!

	public var Gravity:Acc = 10; // i guess this is pixels/second/second.
	public var SignMass:Mass = 5;

    public var OffscreenX:Pos = -9999;
    public var OffscreenY:Pos = -9999;	

    public var Music_m1_path = "assets/music/m1slow.ogg";
    public var Music_m1_bpm = 53;

    public var Image_standing_front_path = "assets/images/standing_front.png";
    public var Image_standing_width:Pixels = 96;
    public var Image_standing_height:Pixels = 184;

    public var Image_sign_front_path = "assets/images/sign1.png";
    public var Image_sign_back_path = "assets/images/blank_sign.png";
    public var Image_sign_width:Pixels = 186;
    public var Image_sign_height:Pixels = 54;
}	
