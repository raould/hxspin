package com.obfusco.hxspin.spinmode;

import com.obfusco.hxspin.sprites.Sign;

interface ISpinMode {
	// return true if the spinmode is done, false otherwise.
	function update( elapsed:Float ):Bool;
}

