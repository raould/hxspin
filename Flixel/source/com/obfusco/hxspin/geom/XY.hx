package com.obfusco.hxspin.geom;

class XY<U> {
	public var x(default,default):U;
	public var y(default,default):U;
	public function new( x:U, y:U ) {
		this.x = x;
		this.y = y;
	}
	public function midpoint( other:XY<U> ):XY<U> {
		return new XY( (x + other.x)/2, (y + other.y)/2 );
	}
}
