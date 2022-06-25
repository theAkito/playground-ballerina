import ballerina/io;

isolated int[] stack = [];

isolated function push(int n) {

    lock {
        stack.push(n);
    }

}

isolated function pop() returns int {
    lock {
        return stack.pop();
    }
}

public function main() {
    push(10);
    push(20);
    io:println(pop());
}