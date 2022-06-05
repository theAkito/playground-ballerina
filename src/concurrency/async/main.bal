import ballerina/io;

public function main() {

    future<int> fut = start foo();

    int|error x = wait fut;

    io:println(x);
}

function foo() returns int {
    return 10;
}