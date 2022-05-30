import ballerina/io;

public function main() returns error? {
    do {

        check foo();
        check bar();

        if !isOK() {

            fail error("not OK");

        }
    }

    on fail var e {
        io:println(e.toString());
        return e;
    }

    return;
}

function foo() returns error? {
    io:println("OK");
    return;
}

function bar() returns error? {
    io:println("OK");
    return;
}

function isOK() returns boolean {

    return false;

}