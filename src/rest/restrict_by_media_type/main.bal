import ballerina/http;

service on new http:Listener(9092) {

    @http:ResourceConfig {
        consumes: ["text/json", "application/json"],
        produces: ["application/xml"]
    }
    resource function post infoService(@http:Payload json msg)
            returns xml|http:InternalServerError {
        json|error nameString = msg.name;
        if (nameString is json) {
            xml name = xml `<name>${<string>nameString}</name>`;
            return name;
        }
        return { body: "Invalid json: `name` not present"};
    }
}