package com.obfusco.hxspin;

import flixel.system.*;
import flixel.*;
import lime.audio.*;

class Tracker {

	private var filename:String;
	private var bpm:Float;
	private var sound:FlxSound;
	private var msecPerBeat:Float;
	private var lastBeatMsec:Float;
	
	public function new( filename:String, bpm:Float )
	{
		this.filename = filename;
		this.bpm = bpm;
		this.sound = FlxG.sound.load( filename, 1 );
        // bpm = x beats per 60 seconds.
        // therefore 1 beat -> x/x : 60/x
		this.msecPerBeat = (60/bpm) * 1000;
		this.lastBeatMsec = 0;
	}

	public function start():Void {
		sound.play();
	}

	public function stop():Void {
		sound.stop();
		// todo: is this the right kind of resetting?
		this.lastBeatMsec = 0;
	}

	public function didBeatHappen():Bool {
		var dt = sound.time - lastBeatMsec;
		var did = dt >= msecPerBeat;
		// skip beats if we're not polled fast enough.
		trace( sound.time, lastBeatMsec, dt, msecPerBeat, did );
		if( did ) {
		  lastBeatMsec = sound.time;
		}
		
		return did;
	}
}
