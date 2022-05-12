import ballerina/io;
import ballerina/lang.value as value;

json j = {
    x: {
        y: {
            z: "ballerina"
        }
    }
};

json v = check j.x.y;
string s1 = check v.z;

string s2 = check value:ensureType(v.z, string);

public function main() {
    io:println("Value of s1: " + s1);
    io:println("Value of s2: " + s2);
}