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

/**
 * Note: Each spin mode should/must reset the sign sprite i.e. to unrotated/transformed, as soon as it starts!
 * todo: I guess I'll put a utility function on the Sign class...
 */

interface ISpinMode {
	// @return Interruptable if the mode can be interrupted/replaced, NotInterruptable otherwise.
	public var interruptable:Interruptable;

	// @return Running if the mode is still going, NotRunning otherwise.
	function update( dt:Seconds ):Running;
}

