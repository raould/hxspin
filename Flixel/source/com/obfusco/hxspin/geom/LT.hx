package com.obfusco.hxspin.geom;

class LT<U> extends XY<U> {
	public var l(get_l,set_l):U;
	public var t(get_t,set_t):U;
	public function new( l:U, t:U ) {
		super( l, t );
	}
	public function get_l():U {
		return x;
	}
	public function get_t():U {
		return y;
	}
}
