import ballerina/http;

service on new http:Listener(9090) {

    resource function 'default [string... paths](http:Request req)
            returns json {
        return {method: req.method, path: paths};
    }
}