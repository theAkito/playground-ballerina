import ballerina/io;

int counter = 0;

function demo() returns int|error {
    worker A returns error? {

        error? res = foo();
        if res is error {
            return res;
        }
        42 -> function;
    }

    int x = check <- A;

    return x;
}

function foo() returns error? {
    if counter == 1 {
        return error("maximum count exceeded");
    }

    counter += 1;
}

public function main() returns error? {
    int a = check demo();
    io:println(a);

    int b = check demo();
    io:println(b);
}