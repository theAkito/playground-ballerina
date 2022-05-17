import ballerina/io;

function foo(json j) returns error? {
    match j {

        {command: "add", amount: var x} => {
            decimal n = check x.ensureType(decimal);
            add(n);
            return;
        }

        _ => {
            return error("invalid command");
        }
    }
}

decimal total = 0;

function add(decimal amount) {
    total += amount;
    io:println("Total: ", total);
}

public function main() returns error? {
    check foo({command: "add", amount: 100, status: "pending"});
    check foo({command: "add", amount: 10});
    check foo({command: "subtract", amount: 100});
    return;
}