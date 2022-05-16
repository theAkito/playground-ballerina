import ballerina/io;

public function main() returns error? {
    int a = 1;
    float b = 2.1;
    decimal c = 3.24;

    json[] d = [a, b, c];

    string e = d.toJsonString();

    io:println(e);

    json f = check e.fromJsonString();

    io:println(f);

    json[] g = <json[]> f;

    io:println(typeof g[0]);
    io:println(typeof g[1]);
    io:println(typeof g[2]);

    float h = check g[2].ensureType();

    io:println(h);

    string i = "-0";

    io:println(typeof check i.fromJsonString());
    return;
}