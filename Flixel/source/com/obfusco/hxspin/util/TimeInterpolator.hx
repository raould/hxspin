package com.obfusco.hxspin.util;

/* attempt to deal with lack of
   accuracy+precision in openfl/lime
   tracking of audio playback.
   this doesn't manage to fix the problem,
   however. fortunately there's updates
   in openfl/lime that supposedly fix it,
   but we have to back port those for flixel. */

class TimeInterpolator {

    private var lastRoughMsec:Float;
    private var lastMsec:Float;

    public function new() {
        this.lastRoughMsec = 0;
        this.lastMsec = 0;
    }

    public function interpolate( roughMsec:Float ):Float {
        var i;
        var now = Sys.time() * 1000;
        var dt = now - lastMsec;
        if( roughMsec == lastRoughMsec ) {
            i = roughMsec + dt;
        }
        else {
            lastRoughMsec = roughMsec;
            lastMsec = now;
            i = roughMsec;
        }
        // shows that this isn't going to work vs. real channel time position. :-(
        // trace( roughMsec, lastRoughMsec, now, lastMsec, i, dt );
        return i;
    }

}
