package com.obfusco.hxspin.spinmode;

import com.obfusco.hxspin.sprites.Sign;

class Wiggle implements ISpinMode {
    
	private static inline var MaxRotDegrees:Float = 30;
	private static inline var MinRotDegrees:Float = -30;
	private var degreesPerSecond:Float = 100;
	private var sign:Sign;

	public function new( sign:Sign ) {
		this.sign = sign;
	}

    public function update( dt:Float ):Bool {
		sign.angle = stepAngle( dt );
		updateWiggle( sign.angle );
		return false; // never really ends until interrupted.
	}

	private function stepAngle( dt:Float ):Float {
		return sign.angle + degreesPerSecond * dt;
    }
                                                       
    private function updateWiggle( angle:Float ):Void {
		if( degreesPerSecond > 0 && angle > MaxRotDegrees ) {
			degreesPerSecond *= -1;
		}
		else if( degreesPerSecond < 0 && angle < MinRotDegrees ) {
			degreesPerSecond *= -1;			
		}
    }
}
