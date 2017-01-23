package com.obfusco.hxspin;

import com.obfusco.hxspin.Units;

class Particle implements IParticle {

	public var m:Mass;
	public var px:Pos;
	public var py:Pos;
	public var vx:Vel;
	public var vy:Vel;
	public var ax:Acc;
	public var ay:Acc;

	public function new( m:Mass ) {
		this.m = m;
		this.px = this.py = this.vx = this.vy = this.ax = this.ay = 0;
	}

	public function applyGravity( g:Acc ) {
		this.ay += g;
	}
}
