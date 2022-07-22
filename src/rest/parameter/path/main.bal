import ballerina/http;

service /company on new http:Listener(9090) {

    resource function get empId/[int id]() returns json {
        return {empId: id};
    }

    resource function get empName/[string first]/[string last]() returns json {
        return {firstName: first, lastName: last};
    }
}