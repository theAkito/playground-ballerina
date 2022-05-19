import ballerina/io;

type Person record {
 string first;
 string last;
 int yearOfBirth;
};

public function main() {
    Person[] persons = [
        {first: "Melina", last: "Kodel", yearOfBirth: 1994},
        {first: "Tom", last: "Riddle", yearOfBirth: 1926}
    ];

    var names1 = from var {first: f, last: l} in persons
                select {first: f, last: l};

    io:println(names1);

    var names2 = from var {first, last} in persons
                select {first, last};

    io:println(names2);
}