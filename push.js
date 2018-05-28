//
// push service
//  - sends out message to all workers in round robin fashion
//
const socket = require('zeromq').socket('push');

const port = "5688"
const address = process.env.ZMQ_BIND_ADDRESS || `tcp://*:${port}`;

console.log(`push binding to: ${address}`);
socket.bindSync(address);

const sendMessage = () => {
	const epoch = new Date().getTime();
	console.log(`push sent: ${epoch}`);
	socket.send(epoch);
};

setInterval(sendMessage, 4000);
