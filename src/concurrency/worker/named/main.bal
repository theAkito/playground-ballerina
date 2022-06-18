import ballerina/io;

public function main() {

    io:println("Initializing");
    final string greeting = "Hello";

    worker A {

        io:println(greeting + " from worker A");

    }

    worker B {
        io:println(greeting + " from worker B");
    }

    io:println(greeting + " from function worker");
}