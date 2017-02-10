package com.obfusco.hxspin.spinmode;

import com.obfusco.hxspin.*;
import com.obfusco.hxspin.Units;
import com.obfusco.hxspin.DB;
import com.obfusco.hxspin.sprites.*;

class ThrowVertical implements ISpinMode {
    
	// todo: support a large throw vs. a small throw.
	// todo: implement making the arc be auto-calculated to hit a given apex.
	public var isExclusive:Bool;
	private var sign:Sign;
	private var tracker:Tracker;
	private var oy:Pos;
	private var m:Particle;

	public function new( sign:Sign, tracker:Tracker ) {
		this.isExclusive = true;
		this.sign = sign;
		this.tracker = tracker;
		this.oy = this.sign.y;
		this.m = new Particle( DB.g.k.SignMass );
		ParticleSpriteUtil.s2m( this.sign, m );
		this.m.vy = -50;
	}

    public function update( dt:Float ):Bool {
		var done;
		if( m.py <= oy ) {
			m.applyGravity( DB.g.k.Gravity );
			DB.g.solver( dt, m );
			ParticleSpriteUtil.m2s( m, sign );
			done = false;
		}
		else {
			done = true;
		}
		return done;
	}

}