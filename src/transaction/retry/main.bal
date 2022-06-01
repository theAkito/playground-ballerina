import ballerina/io;

public function main() returns error? {

    retry transaction {
        check doStage1();
        check doStage2();
        check commit;
    }

    return;
}

function doStage1() returns error? {
    io:println("Stage1 completed");
    return;
}

function doStage2() returns error? {

    return error 'error:Retriable("Stage2 failed");

}