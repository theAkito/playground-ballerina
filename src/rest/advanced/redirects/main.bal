import ballerina/http;

http:Client clientEndpoint = check new ("http://localhost:9092", {
        followRedirects: {enabled: true, maxCount: 5}
    }
);

service / on new http:Listener(9090) {

    resource function get hello() returns string|error {

        string returnResult = check clientEndpoint->get("/redirect1");
        return "Response received : " + returnResult;
    }
}

service / on new http:Listener(9092) {

    resource function get redirect1(http:Caller caller) returns error? {
        http:Response res = new;

        check caller->redirect(res,
            http:REDIRECT_TEMPORARY_REDIRECT_307,
            ["http://localhost:9093/redirect2"]);
    }
}

service /redirect2 on new http:Listener(9093) {

    resource function get .() returns string {

        return "Hello World!";
    }
}