import ballerina/http;

service /demo on new http:Listener(8080) {

    resource function get greeting/hello/[string name]() returns string {

        return "Hello, " + name;
    }
}