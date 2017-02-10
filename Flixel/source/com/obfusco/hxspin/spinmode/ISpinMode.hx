package com.obfusco.hxspin.spinmode;

import com.obfusco.hxspin.Units;
import com.obfusco.hxspin.sprites.Sign;

enum Interruptable {
	Interruptable;
	NotInterruptable;
}

enum Running {
	Running;
	NotRunning;
}

interface ISpinMode {
	// @return Interruptable if the mode can be interrupted/replaced, NotInterruptable otherwise.
	public var interruptable:Interruptable;

	// @return Running if the mode is still going, NotRunning otherwise.
	function update( dt:Seconds ):Running;
}

