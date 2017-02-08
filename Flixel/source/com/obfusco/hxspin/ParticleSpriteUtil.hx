package com.obfusco.hxspin;

import flixel.FlxSprite;
import com.obfusco.hxspin.Units;
import com.obfusco.hxspin.IParticle;

class ParticleSpriteUtil {

	public static function m2s( m:IParticle, s:FlxSprite ):Void {
		s.x = m.px;
		s.y = m.py;
	}

	public static function s2m( s:FlxSprite, m:IParticle ):Void {
		m.px = s.x;
		m.py = s.y;
	}

}
