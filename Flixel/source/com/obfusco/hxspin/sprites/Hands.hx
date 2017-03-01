package com.obfusco.hxspin.sprites;

class HandPositions {

	public var left(default,null):CXY<Pixels>;
	public var right(default,null):CXY<Pixels>;

	public function new( left:CXY<Pixels>, right:CXY<Pixels> ) {
		this.left = left;
		this.right = right;
	}

}
