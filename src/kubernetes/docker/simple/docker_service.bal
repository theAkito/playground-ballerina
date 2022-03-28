// https://ballerina.io/learn/by-example/c2c-deployment.html
// https://ballerina.io/learn/run-ballerina-programs-in-the-cloud/code-to-cloud-deployment/
// https://github.com/ballerina-platform/ballerina-spec/blob/master/c2c/code-to-cloud-spec.md

import ballerina/http;

listener http:Listener helloEP = new(9090);

service http:Service /helloWorld on helloEP {
    resource function get sayHello() returns string {
        return "Hello, World from service helloWorld ! \n";
    }
}