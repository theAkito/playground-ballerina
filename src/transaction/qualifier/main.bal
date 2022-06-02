import ballerina/io;

type Update record {
    int updateIndex;
    int stockMnt;
};

public function main() returns error? {
    Update updates = {updateIndex: 0, stockMnt: 100};
    transaction {
        check doUpdate(updates);
        check commit;
    }
    return;
}

transactional function doUpdate(Update u) returns error? {

    foo(u);

    bar(u);
    return;
}

function foo(Update u) {
    if transactional {

        bar(u);

    }
}

transactional function bar(Update u) {
    io:println("Calling from a transactional context");
}