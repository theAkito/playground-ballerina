import ballerina/http;
import ballerina/io;

http:Client securedEP = check new("https://localhost:9090",
    secureSocket = {
        cert: "../resource/path/to/public.crt"
    }
);

public function main() returns error? {
    string response = check securedEP->get("/foo/bar");
    io:println(response);
}