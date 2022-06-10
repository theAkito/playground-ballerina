import ballerina/io;

function demo(string s) returns int|error {

    worker A returns int|error {

        int x = check int:fromString(s);
        return x + 1;

    }

    io:println("In function worker");

    int y = check wait A;

    return y + 1;
}

public function main() returns error? {
    int res = check demo("50");
    io:println(res);

    res = check demo("50m");
    io:println(res);
}