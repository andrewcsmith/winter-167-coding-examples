// Start the Tidal synth
include("SuperDirt")
SuperDirt.start

// Listen on the OSCdef thing
(
OSCdef.new(\bus, {
	arg msg, time, addr, recvPort;
	msg.postln;
}, "/hi/print");
)

// Which port should we send to?
NetAddr.localAddr.port;

~addr = NetAddr.new("127.0.0.1", 57126);
~addr.sendMsg('/hi/osc', 400);

(
fork {
	loop {
		~addr.sendMsg('/hi/osc', 300.rrand(400));
		1.wait;
	}
};
)

