import ballerina/http;

service / on new http:Listener(8080) {

    resource function get hello(string name) returns string {
        return "Hello, " + name;
    }

}