import ballerina/io;

public function main() {

    worker A {

        1 -> B;
        2 -> C;

    }

    worker B {

        int x1 = <- A;

        x1 -> function;

    }

    worker C {
        int x2 = <- A;
        x2 -> function;
    }

    int y1 = <- B;
    int y2 = <- C;
    
    io:println(y1 + y2);
}