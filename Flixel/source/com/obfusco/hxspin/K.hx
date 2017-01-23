package com.obfusco.hxspin;

import com.obfusco.hxspin.Units;
import com.obfusco.hxspin.IParticle;

class K/*onstants*/ {

	public static inline function Step( dt:Seconds, m:IParticle ):Void {
		// dumb Euler for now.
		m.px += m.m * m.vx * dt;
		m.py += m.m * m.vy * dt;
		m.vx += m.m * m.ax * dt;
		m.vy += m.m * m.ay * dt;
		m.ax = 0;
		m.ay = 0;
	}

	public static inline var Gravity:Acc = 10; // i guess this is pixels/second/second.
	public static inline var SignMass:Mass = 5;

    public static inline var OffscreenX:Pos = -9999;
    public static inline var OffscreenY:Pos = -9999;	

    public static inline var Music_m1_path = "assets/music/m1slow.ogg";
    public static inline var Music_m1_bpm = 53;

    public static inline var Image_standing_path = "assets/images/standing.png";
    public static inline var Image_standing_width:Pos = 96;
    public static inline var Image_standing_height:Pos = 184;

    public static inline var Image_sign_path = "assets/images/sign1.png";
    public static inline var Image_sign_width = 186;
    public static inline var Image_sign_height = 54;
}	
