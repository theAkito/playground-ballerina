import ballerina/io;
import ballerina/test;

@test:BeforeSuite
function beforeSuit() {
    io:println("I'm the before suite function!");
}

@test:Config { }
function testFunction1() {
    io:println("I'm in test function 1!");
    test:assertTrue(true, msg = "Failed");
}

@test:Config { }
function testFunction2() {
    io:println("I'm in test function 2!");
    test:assertTrue(true, msg = "Failed");
}

@test:AfterSuite { }
function afterSuite() {
    io:println("I'm the after suite function!");
}