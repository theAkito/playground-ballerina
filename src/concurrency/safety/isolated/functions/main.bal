import ballerina/io;

type R record {
    int v;
};

final int N = getN();

function getN() returns int {
    return 100;
}

isolated function set(R r) returns R {

    r.v = N;

    return r;
}

R r = {v: 0};

function setGlobal(int n) {

    r.v = n;
}

public function main() {
    setGlobal(200);
    io:println(r);
    io:println(set(r));
}