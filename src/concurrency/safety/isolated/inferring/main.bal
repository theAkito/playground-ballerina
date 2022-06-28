import ballerina/io;

public function main() {

    worker A {

        string a = sayHello("John");

        io:println(a);
    }

    worker B {
        string b = sayHello("Anne");
        io:println(b);
    }

    boolean c = sayHello is isolated function (string str) returns string;

    io:println(c);
}

function sayHello(string name) returns string {
    return "Hello " + name;
}