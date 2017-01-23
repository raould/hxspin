package com.obfusco.hxspin.spinmode;

import com.obfusco.hxspin.sprites.Sign;

class ThrowVertical implements ISpinMode {
    
	// todo: nicer if the arc is based on a top point
	// rather than hacky fake physics.
	private var sign:Sign;
	private var mass:Float;
	private var oy:Float;
	private var dy:Float;

	public function new( sign:Sign ) {
		// todo: support a large throw vs. a small throw.
		this.sign = sign;
		this.oy = sign.y;
		this.dy = -200;
	}

    public function update( elapsed:Float ):Bool {
		var done;
		if( sign.y <= oy ) {
			sign.y += (dy*elapsed);
			dy += (K.Gravity*elapsed);
			done = false;
		}
		else {
			done = true;
		}
		return done;
	}

}
