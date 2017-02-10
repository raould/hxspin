package com.obfusco.hxspin.spinmode;

import com.obfusco.hxspin.sprites.Sign;
import com.obfusco.hxspin.spinmode.ISpinMode;

class Wiggle implements ISpinMode {
    
	private static inline var MaxRotDegrees:Float = 30;
	private static inline var MinRotDegrees:Float = -30;
	public var interruptable:Interruptable;
	private var degreesPerSecond:Float;
	private var sign:Sign;
	private var tracker:Tracker;

	public function new( sign:Sign, tracker:Tracker ) {
		this.interruptable = Interruptable;
		this.sign = sign;
		this.tracker = tracker;
		// trying to match the beat.
		this.degreesPerSecond = (MaxRotDegrees - MinRotDegrees) / (this.tracker.msecPerBeat/1000);
	}

    public function update( dt:Float ):Running {
		sign.angle = stepAngle( dt );
		updateWiggle( sign.angle );
		return Running;
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
