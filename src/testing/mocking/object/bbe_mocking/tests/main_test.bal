

import ballerina/test;
import ballerina/http;
import ballerina/email;

public client class MockHttpClient {
    remote isolated function get(@untainted string path,
    map<string|string[]>? headers = (),
    http:TargetType targetType = http:Response) returns
    http:Response | anydata | http:ClientError {
        http:Response response = new;
        response.statusCode = 500;
        return response;
    }
}

@test:Config { }
function testTestDouble() {

    clientEndpoint = test:mock(http:Client, new MockHttpClient());
    http:Response res = performGet();
    test:assertEquals(res.statusCode, 500);
}

@test:Config { }
function testReturn() {

    clientEndpoint = test:mock(http:Client);

    test:prepare(clientEndpoint).when("get").thenReturn(new http:Response());
    http:Response res = performGet();
    test:assertEquals(res.statusCode, 200);
}

@test:Config { }
function testReturnSequence() {
    http:Response mockResponse = new;
    mockResponse.statusCode = 404;

    clientEndpoint = test:mock(http:Client);

    test:prepare(clientEndpoint).when("get").thenReturnSequence(
        new http:Response(), mockResponse);
    http:Response res = performGet();
    test:assertEquals(res.statusCode, 404);
}

@test:Config { }
function testReturnWithArgs() {
    http:Response mockResponse = new;
    mockResponse.statusCode = 404;
    clientEndpoint = test:mock(http:Client);

    test:prepare(clientEndpoint).when("get").
    withArguments("/headers").thenReturn(mockResponse);

    test:prepare(clientEndpoint).when("get").withArguments("/get?test=123")
        .thenReturn(mockResponse);
    http:Response res = performGet();
    test:assertEquals(res.statusCode, 404);
}

@test:Config { }
function testSendNotification() {
    smtpClient = test:mock(email:SmtpClient);

    test:prepare(smtpClient).when("sendMessage").doNothing();
    string[] emailIds = ["user1@test.com", "user2@test.com"];
    error? err = sendNotification(emailIds);
    test:assertEquals(err, ());
}

@test:Config {}
function testMemberVariable() {
    string mockId = "test";
    lock {
        exampleClient = test:mock(ExampleClient);

        test:prepare(exampleClient).getMember("id").thenReturn(mockId);
        test:assertEquals(exampleClient.id, mockId);
    }
}