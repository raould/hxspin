package com.obfusco.hxspin.spinmode;

import com.obfusco.hxspin.sprites.Sign;

class FlipVertical implements ISpinMode {
    
	public var isExclusive:Bool;
	private static inline var MaxScale:Float = 1;
	private var scalePerSecond:Float;
	private var currentScale:Float;
	private var isFlipped:Bool;
	private var sign:Sign;
	private var tracker:Tracker;

	public function new( sign:Sign, tracker:Tracker ) {
		this.isExclusive = true;
		this.sign = sign;
		this.tracker = tracker;
		this.scalePerSecond = 0.5;
		this.isFlipped = false;
		this.currentScale = 1.0;
	}

    public function update( dt:Float ):Bool {
		updateFlip();
		sign.scale.set( 1, this.currentScale );
		return false; // never really ends until interrupted.
	}

	private function stepScale( dt:Float ):Float {
		return this.currentScale + this.scalePerSecond * dt;
    }
                                                       
    private function updateFlip():Void {
		if ((isFlipped && currentScale >= 1.0) || (!isFlipped && currentScale <= 0.0)) {
			isFlipped = !isFlipped;
			sign.flip();
		}
		if (isFlipped) {
			currentScale += 0.1;
		} else {
			currentScale -= 0.1;
		}
    }
}