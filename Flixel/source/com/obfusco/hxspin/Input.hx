package com.obfusco.hxspin;

import flixel.FlxG;

class Input {

	public static function isQuitPressed():Bool {
#if !FLX_NO_KEYBOARD
		return FlxG.keys.anyPressed( [ESCAPE] );
#end
	}

	public static function getPressed():Bool {
#if !FLX_NO_KEYBOARD
		return FlxG.keys.anyPressed( [SPACE] );
#end
	}

}

/*
  todo: something like the below
  or something more OOPY.

		#if (web || desktop)
		keyboardControls();
		mouseControls();
		#end

		#if desktop
		gamepadControls();
		#end

		#if mobile
		touchControls();
		#end
*/
