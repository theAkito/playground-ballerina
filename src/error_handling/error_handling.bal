// https://ballerina.io/learn/configure-ballerina-programs/quick-start-on-configurable-variables/
// https://ballerina.io/learn/by-example/error-handling.html

import ballerina/io;
import ballerina/lang.'int;

configurable string input = "";

public function main() returns error? {
  int|error result = int:fromString(input);
  if result is error {
    io:println("Error occurred when trying to parse the following input as String: " + input);
    io:println("Error: " + result.toBalString());
    return result;
  } else {
    io:println("Parsing was successful: " + result.toBalString());
  }
}