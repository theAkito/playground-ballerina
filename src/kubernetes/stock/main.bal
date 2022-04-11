 import ballerina/http;
 import ballerina/io;

 listener http:Listener helloEP = new (9090);

 service /helloWorld on helloEP {
     resource function get sayHello() returns string|error? {
         json config = check read("./resources/config.json");
         string greeting = check config.greeting;
         return greeting + ", Kubernetes!";
     }
 }

 function read(string path) returns @tainted json|error {
     io:ReadableByteChannel rbc = check io:openReadableFile(path);
     io:ReadableCharacterChannel rch = new (rbc, "UTF8");
     var result = rch.readJson();
     _ = check rch.close();
     return result;
 }
