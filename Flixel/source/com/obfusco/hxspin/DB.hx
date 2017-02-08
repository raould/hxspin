package com.obfusco.hxspin;

import com.obfusco.hxspin.Units;
import com.obfusco.hxspin.IParticle;

/*

since this class gets used everywhere,
the naming will be evil, mean, and terse.

maybe use something like https://github.com/martamius/TJSON
some day to make this something we can save/restore.

*/

class DB {

	// !!! todo: figure out how to replace singleton with d.i./i.o.c. in Haxe Flixel. !!!
	public static var g(default, null):DB = new DB();
	private function new () {
		this.k = new K();
	}

	public var k:K;

	public var solver: Seconds -> IParticle -> Void = function(dt:Seconds, m:IParticle):Void {
		// dumb Euler for now.
		m.px += m.m * m.vx * dt;
		m.py += m.m * m.vy * dt;
		m.vx += m.m * m.ax * dt;
		m.vy += m.m * m.ay * dt;
		m.ax = 0;
		m.ay = 0;
	}

	// todo: random with seed so we can replay/restart/share games.

}
