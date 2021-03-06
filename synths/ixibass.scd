
SynthDef(\ixibass, {|
	t_trig = 1,
	freq = 100,
	rq = 0.004,
	panX=0,
	panY=0,
	amp = 0|

	var env, signal;
	var rho, theta, b1, b2;
	b1 = 1.98 * 0.989999999 * cos(0.09);
	b2 = 0.998057.neg;
	signal = SOS.ar(K2A.ar(t_trig), 0.123, 0.0, 0.0, b1, b2);
	signal = RHPF.ar(signal, freq, rq) + RHPF.ar(signal, freq*0.5, rq);
	signal = Decay2.ar(signal, 0.4, 0.3, signal);
	DetectSilence.ar(signal, 0.01, doneAction:0);
	Pan4.ar(signal, panX, panY, amp);
}).add;