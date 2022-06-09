import ballerina/io;

public function main() {

    worker A {
        io:println("In worker A");
    }

    @strand {
        thread: "any"
    }

    worker B {
        io:println("In worker B");
    }

    io:println("In function worker");
}