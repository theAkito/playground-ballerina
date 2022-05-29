import ballerina/io;

public function main() returns error? {

    transaction {
        doStage1();
        doStage2();

        check commit;

    }
    return;
}

function doStage1() {
    io:println("Stage1 completed");
}

function doStage2() {
    io:println("Stage2 completed");
}