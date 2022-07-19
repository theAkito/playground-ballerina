import ballerina/http;

xmlns "http://www.test.com" as test;

type Student record {
    string Name;
    int Grade;
};

service /hello on new http:Listener(9090) {

    resource function post student(@http:Payload Student student)
            returns json {
        string name = student.Name;
        return {Name: name};
    }

    resource function post store(@http:Payload xml store) returns xml {
        xml city = store/<test: city>;
        return city;
    }
}