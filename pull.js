//
// pull service
//	- worker recieves message from push service - round robin
//
const socket = require('zeromq').socket('pull');

const port = "5688"
const address = process.env.ZMQ_PUB_ADDRESS || `tcp://127.0.0.1:${port}`;

console.log(`pull connecting: ${address}`);
socket.connect(address);

socket.on(`message`, (msg) => {
	console.log(`pull received: ${msg}`);
});
