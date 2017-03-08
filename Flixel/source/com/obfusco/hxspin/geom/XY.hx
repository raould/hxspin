package com.obfusco.hxspin.geom;

class XY<U:Float> {
	public var x(default,default):U;
	public var y(default,default):U;
	public function new( x:U, y:U ) {
		this.x = x;
		this.y = y;
	}
	public function midpoint( other:XY<U> ):XY<U> {
		var x0 = x; var x1 = other.x;
		var y0 = y; var y1 = other.y;
		var xm = (x0+x1)/2.0; var ym = (y0+y1)/2.0;
		return new XY<U>( cast xm, cast ym ); // todo: cast really needed wtf?
	}
}
