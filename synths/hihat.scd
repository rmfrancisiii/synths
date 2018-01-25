SynthDef(\hihat, {|
	t_gate=1,
	len=0.02,
	lpFreq=6000,
	hpFreq=2500,
	out=0,
	amp=0|
	var env = Env([0, 1.0, 0], [0, 1], [\lin]);
	var envGen = EnvGen.kr(env, t_gate, doneAction: 0, timeScale: len);
	var hit = HPF.ar(LPF.ar(WhiteNoise.ar(1), lpFreq), hpFreq);
	Out.ar(out, (hit * envGen * amp));
},
).add;

