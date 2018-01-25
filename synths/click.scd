SynthDef(\click, {
	|out=0,
	freq=120,
	amp=0|

    var click;
    click = Impulse.ar(freq);
    DetectSilence.ar(click,doneAction:0);
    OffsetOut.ar(out, click * amp);
}).add;


	