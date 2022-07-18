import ballerina/http;

service http:Service /foo on new http:Listener(9090) {

    resource function post bar(@http:Payload json payload) returns json {
        return payload;
    }
}