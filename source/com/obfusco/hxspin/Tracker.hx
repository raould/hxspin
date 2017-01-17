package com.obfusco.hxspin;

import flixel.system.*;
import flixel.*;
import lime.audio.*;

class Tracker {

	private var filename:String;
	private var bpm:Float;
	private var listeners:Array<TrackerListener>;
	private var sound:FlxSound;

	public function new( filename:String, bpm:Float )
	{
		this.filename = filename;
		this.bpm = bpm;
		this.listeners = new Array<TrackerListener>();
		this.sound = FlxG.sound.load( K.Path_music_m1, 1 );
	}

	
}
