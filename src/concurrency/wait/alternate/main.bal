import ballerina/http;
import ballerina/io;

function altFetch(string urlA, string urlB) returns string|error {

    worker A returns string|error {
        return fetch(urlA);
    }

    worker B returns string|error {
        return fetch(urlB);
    }

    return wait A | B;

}

public function main() returns error? {
    string res =
        check altFetch("https://postman-echo.com/get?lang=ballerina",
                       "https://postman-echo.com/get?greeting=hello");
    io:println(res);
}

function fetch(string url) returns string|error {
    http:Client cl = check new (url);
    map<json> payload = check cl->get("");
    return payload["args"].toString();
}