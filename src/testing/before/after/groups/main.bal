import ballerina/io;
import ballerina/test;

@test:BeforeGroups { value:["g1"] }
function beforeGroupsFunc() {
    io:println("I'm the before groups function!");
}

@test:AfterGroups { value:["g1"] }
function afterGroupsFunc() {
    io:println("I'm the after groups function!");
}

@test:Config { groups: ["g1"]}
function testFunction1() {
    io:println("I'm in test function 1!");
    test:assertTrue(true, msg = "Failed!");
}

@test:Config {}
function testFunction2() {
    io:println("I'm in test function 2!");
    test:assertTrue(true, msg = "Failed!");
}