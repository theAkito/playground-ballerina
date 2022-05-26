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

    string[] names = from var {first, last} in persons

                     let int len1 = first.length()

                     where len1 > 0

                     let int len2 = last.length()
                     where len2 > 0
                     let string name = first + " " + last
                     select name;
                     
    io:println(names);
}