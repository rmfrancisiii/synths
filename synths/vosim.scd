// Robert vosim
SynthDef(\vosim, {|
   amp=0.45,
    att = 0.15,
    t_gate=1,
    dur = 1,
    harms = 6,
    out = 0,
    impfreq = 1,
    impdepth = 9,
    freq = 400,
    freqspread = 1.06,
    endfreq = 1,
    ncycles = 4,
    decay = 0.9|


    var env = Env([0.001, amp, 0.001], [att, dur - att], [\lin, \sin]);
    var envGen = EnvGen.kr(env, t_gate, timeScale: dur, doneAction: 0);
    harms.do({|i|
        Out.ar(out, Pan2.ar(VOSIM.ar(Impulse.ar(
            SinOsc.kr(impfreq, 1/(i+1), i+1*impdepth, i+1*impdepth+1)),
            EnvGen.kr(Env([freq*i*freqspread, freq*i*freqspread,
            freq*i*freqspread*endfreq], [0, dur]), t_gate, timeScale: dur, doneAction: 0),
            ncycles,
            decay),
           SinOsc.kr(SinOsc.kr(i+1*0.47, 4, 1)), 1/harms)
                  )*envGen});
}).add;