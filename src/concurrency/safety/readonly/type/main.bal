import ballerina/io;

const s = "Anne";

type Row record {

    readonly string k;
    int value;

};

table<Row> key(k) t = table [
    {k: "John", value: 17}
];

public function main() {

    t.add({k: s, value: 18});

    io:println(t);
}