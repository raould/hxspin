package com.obfusco.hxspin.spinmode;

import com.obfusco.hxspin.Units;
import com.obfusco.hxspin.sprites.Sign;

interface ISpinMode {
	// return true if the spinmode is done, false otherwise.
	function update( dt:Seconds ):Bool;
}

