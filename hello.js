const Net = require('net');
var fs = require('fs');

var contents = process.env.SNODES.split(",");
console.log(contents[0]);
var host = contents[0].split(":")[0];
var port = contents[0].split(":")[1];

const client = new Net.Socket();
client.connect(({ port: port, host: host }), function() {
    console.log('TCP connection established with the server.');
    client.write('Hello, server.');
});

client.on('data', function(chunk) {
    console.log('Data received from the server: ',chunk.toString());
    
});

client.on('end', function() {
    console.log('Requested an end to the TCP connection');
});