import ballerina/http;
import ballerina/io;

public function main() returns error? {

    http:Client httpClient = check new ("https://api.github.com");

    http:Response resp =
                    check httpClient->get("/orgs/ballerina-platform/repos");

    io:println(resp.statusCode);
}