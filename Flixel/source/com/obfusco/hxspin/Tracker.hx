package com.obfusco.hxspin;

import flixel.system.*;
import flixel.*;
import lime.audio.*;
import com.obfusco.hxspin.util.TimeInterpolator;

/**
 * Try to help know when the beats are happening, for game play.
 * Includes hacky working around the insufficient resolution of FlxSound.time.
 */
class Tracker {

	private var filename:String;
	public var bpm:Float;
	public var msecPerBeat:Float;
	private var sound:FlxSound;
	private var lastBeatMsec:Float;
    private var ti:TimeInterpolator;
	
	public function new( filename:String, bpm:Float ) {
		this.filename = filename;
		this.bpm = bpm;
		this.sound = FlxG.sound.load( filename, 1 );
        // bpm = x beats per 60 seconds, so 1 beat = x/x = 60/x.
		this.msecPerBeat = (60/bpm) * 1000;
		this.lastBeatMsec = 0;
        this.ti = new TimeInterpolator();
	}

	public function start():Void {
		sound.play();
	}

	public function stop():Void {
		sound.stop();
		// todo: uh, is this the right kind of resetting?
		this.lastBeatMsec = 0;
	}

	public function didBeatHappen():Bool {
        var t = ti.interpolate( sound.time );
		var dt = t - lastBeatMsec;
		var did = dt >= msecPerBeat;
		// yes, this skip beats if we're not polled fast enough.
		//trace( sound.time, t, lastBeatMsec, dt, msecPerBeat, did );
		if( did ) {
            lastBeatMsec = t;
		}
		return did;
	}
}
