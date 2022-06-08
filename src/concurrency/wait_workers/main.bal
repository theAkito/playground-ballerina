import ballerina/io;

public function main() {
    io:println("Initializing");

    worker A {
        io:println("In worker A");
    }

    io:println("In function worker");

    wait A;

    io:println("After wait A");
}