import ballerina/io;
import ballerina/test;

@test:BeforeEach
function beforeEachFunc() {
    io:println("I'm the before each function!");
}

@test:AfterEach
function afterEachFunc() {
    io:println("I'm the after each function!");
}

@test:Config { }
function testFunction1() {
    io:println("I'm in test function 1!");
    test:assertTrue(true, msg = "Failed!");
}

@test:Config { }
function testFunction2() {
    io:println("I'm in test function 2!");
    test:assertTrue(true, msg = "Failed!");
}