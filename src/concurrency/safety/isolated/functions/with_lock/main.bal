import ballerina/io;

type R record {
    int v;
};

isolated R r = {v: 0};

isolated function setGlobal(int n) {

    lock {
        r.v = n;
    }

}

public function main() {
    setGlobal(200);

    lock {
       io:println(r);
    }

}