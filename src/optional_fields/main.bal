import ballerina/io;

type Headers record {
   string 'from;
   string to;

   string subject?;

};

Headers h = {
  'from: "John",
  to: "Jill"
};

string? subject = h?.subject;

public function main() {
    io:println("Header value: ", h);
    io:println("Subject value:", subject);
}