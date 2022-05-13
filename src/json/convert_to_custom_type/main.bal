import ballerina/io;

type Coord record {
    float x;
    float y;
};

public function main() {
    json j = {x: 1.0, y: 2.0};
    json k = j.cloneReadOnly();
    Coord c = <Coord> k;

    io:println(c.x);
    io:println(c.y);
}