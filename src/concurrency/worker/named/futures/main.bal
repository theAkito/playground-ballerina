import ballerina/io;

function demo() returns future<int> {
    worker A returns int {
        return 42;
    }

    return A;

}

type FuncInt function () returns int;

function startInt(FuncInt f) returns future<int> {

    return start f();

}

public function main() returns error? {
    future<int> a = demo();
    int b = check wait a;
    io:println(b);

    future<int> c = startInt(() => 100);
    int d = check wait c;
    io:println(d);
}