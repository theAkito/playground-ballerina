import ballerina/io;

isolated class Counter {

    private int n = 0;

    isolated function get() returns int {
        lock {

            return self.n;

        }
    }

    isolated function inc() {
        lock {
            self.n += 1;
        }
    }
}

public function main() {

    Counter c = new;

    c.inc();
    int v = c.get();
    io:println(v);
}