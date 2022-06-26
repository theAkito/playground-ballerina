
import ballerina/io;

class EvenNumber {
    int i = 1;

    isolated function generate() returns int {

        lock {

            return self.i * 2;

        }
    }
}

public function main() {
    EvenNumber e = new;
    int c = e.generate();
    io:println(c);
}