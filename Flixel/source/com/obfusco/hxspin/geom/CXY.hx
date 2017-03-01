package com.obfusco.hxspin.geom;

// todo: abstract from XY<U>?
class CXY<U> {
	public var x(default,default):U;
	public var y(default,default):U;
	public function new( x:U, y:U ) {
		this.x = x;
		this.y = y;
	}
}
