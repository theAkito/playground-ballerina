import ballerina/http;
import ballerina/log;

type Person record {|
    string name;
    int age;
|};

http:Client backendClient = check new("http://localhost:9092");

service /call on new http:Listener(9090) {

    resource function get all() returns json|error {

        string result = check backendClient->get("/backend/string");
        log:printInfo("String payload: " + result);

        Person person = check backendClient->get("/backend/person");
        log:printInfo("Person name: " + person.name);
        return person;
    }

    resource function get '5xx() returns json {
        json|error res = backendClient->post("/backend/5XX", "want 500");
        if (res is http:RemoteServerError) {
            http:Detail detail = res.detail();
            return { code:detail.statusCode, payload:<string>detail.body};
        } else {
            return { code: "invalid" };
        }
    }

    resource function get '4xx() returns json {
        json|error res = backendClient->post("/backend/err", "want 400");
        if (res is http:ClientRequestError) {
            http:Detail detail = res.detail();
            return { code:detail.statusCode, payload:<string>detail.body};
        } else {
            return { code: "invalid" };
        }
    }
}

service /backend on new http:Listener(9092) {

    resource function get 'string() returns string {
        return "Hello ballerina!!!!";
    }

    resource function get person() returns record {|*http:Ok; Person body;|} {
        return {body: {name: "Smith", age: 15}};
    }

    resource function post '5XX() returns http:NotImplemented {
        return {body:"data-binding-failed-with-501"};
    }
}