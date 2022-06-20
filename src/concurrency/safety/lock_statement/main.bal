import ballerina/io;

int n = 0;

function inc() {

    lock {
        n += 1;
    }

    io:println(n);
}

public function main() {
    inc();
}