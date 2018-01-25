//This synth doesn't have panning capability. Assign note events to an out (0, 1, 2, or 3) or an array of outs.

(
SynthDef(\pulse, {|
	out=0,
	freq=440,
	dur=0.1,
	t_gate=1,
	amp=0.25,
	pan=0,
	att=0.15,
	mod1=0.001,
	mod2=0.001,
	int=0.5|

	var harmonics = 3;
	var env = Env([0.001, 0.9, 0.001], [att, 1.0-att], [\sin, \sin]);
	var envGen = EnvGen.kr(env, t_gate, doneAction: 0, timeScale: dur);
	var freqArry = Array.fill(harmonics, {
		arg i; (freq + (i * int * freq)) });

	var width = XLine.ar(mod1, mod2, dur);
	var pulse = Pulse.ar(freqArry, width, amp/harmonics);
	Out.ar(out, pulse * envGen);
}).add;
)