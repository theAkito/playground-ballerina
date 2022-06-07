import ballerina/http;
import ballerina/io;

public function main() returns error? {

    http:Client cl = check new ("https://www.mocky.io");

    string payload = check cl->get("/v2/5ae082123200006b00510c3d/");

    io:println(payload);
    return;
}