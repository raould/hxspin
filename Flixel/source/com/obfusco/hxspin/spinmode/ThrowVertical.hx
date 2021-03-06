package com.obfusco.hxspin.spinmode;

import com.obfusco.hxspin.*;
import com.obfusco.hxspin.Units;
import com.obfusco.hxspin.DB;
import com.obfusco.hxspin.sprites.*;
import com.obfusco.hxspin.spinmode.ISpinMode;

class ThrowVertical implements ISpinMode {
    
	// todo: support a large throw vs. a small throw.
	// todo: implement making the arc be auto-calculated to hit a given apex.
	public var interruptable:Interruptable;
	private var sign:Sign;
	private var tracker:Tracker;
	private var originalY:Pos;
	private var m:Particle;

	public function new( person:Person, sign:Sign, tracker:Tracker ) {
		// reset the Sign first because we then use that
		// position to make our own particle.
		sign.resetToCXY( person.getHandsCXY() );

		this.sign = sign;
		this.tracker = tracker;
		this.interruptable = Interruptable;

		this.m = new Particle( DB.g.k.SignMass );
		ParticleSpriteUtil.s2m( this.sign, m );
		this.m.vy = -50;
		this.originalY = this.sign.y;
	}

    public function update( dt:Float ):Running {
		var done;
		if( m.py <= originalY ) {
			m.applyGravity( DB.g.k.Gravity );
			DB.g.solver( dt, m );
			ParticleSpriteUtil.m2s( m, sign );
			done = Running;
		}
		else {
			done = NotRunning;
		}
		return done;
	}

}
