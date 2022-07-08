import ballerina/test;
import ballerina/io;
@test:Mock { functionName: "intAdd" }
test:MockFunction intAddMockFn = new();

@test:Config {}
function testReturn() {

    test:when(intAddMockFn).thenReturn(20);

    test:when(intAddMockFn).withArguments(0, 0).thenReturn(-1);

    test:assertEquals(intAdd(10, 6), 20, msg = "function mocking failed");
    test:assertEquals(intAdd(0, 0), -1,
            msg = "function mocking with arguments failed");
}

@test:Mock {
    moduleName: "ballerina/io",
    functionName: "println"
}
test:MockFunction printlnMockFn = new();

int tally = 0;

public function mockPrint(any|error... val) {
    tally = tally + 1;
}

@test:Config {}
function testCall() {

    test:when(printlnMockFn).call("mockPrint");

    io:println("Testing 1");
    io:println("Testing 2");
    io:println("Testing 3");

    test:assertEquals(tally, 3);
}