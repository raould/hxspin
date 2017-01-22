package com.obfusco.hxspin.spinmode;

import com.obfusco.hxspin.sprites.Sign;

class Wiggle implements ISpinMode {
    
	private static inline var MaxRotDegrees:Float = 30;
	private static inline var MinRotDegrees:Float = -30;
	private var degreesPerSecond:Float = 100;

	public function new() {}

    public function update( sign:Sign, elapsed:Float ):Void {
		sign.angle = stepAngle( sign, elapsed );
		updateWiggle( sign.angle );
	}

	private function stepAngle( sign:Sign, elapsed:Float ):Float {
		// todo: software rotation is purportedly 10x slower than rotation via tilesheet frames.
		// todo: animate the player at least a little and match them up.
		return sign.angle + degreesPerSecond * elapsed;
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
