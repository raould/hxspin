package com.obfusco.hxspin.spinmode;

import com.obfusco.hxspin.Units;
import com.obfusco.hxspin.sprites.Sign;

interface ISpinMode {
	// @return true if the mode cannot be interrupted/replaced, false otherwise.
	public var isExclusive:Bool;

	// @return true if the mode is done, false otherwise.
	function update( dt:Seconds ):Bool;
}

