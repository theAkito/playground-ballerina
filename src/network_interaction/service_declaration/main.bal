import ballerina/io;
import ballerina/udp;

service on new udp:Listener(8080) {
    remote function onDatagram(readonly & udp:Datagram dg) {
        io:println("bytes received: ", dg.data.length());
    }
}