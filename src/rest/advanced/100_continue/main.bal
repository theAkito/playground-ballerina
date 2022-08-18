import ballerina/http;
import ballerina/log;

service / on new http:Listener(9090) {

    resource function 'default hello(http:Caller caller, http:Request request)
            returns error? {

        if (request.expects100Continue()) {
            string mediaType = request.getContentType();
            if (mediaType.toLowerAscii() == "text/plain") {

                var result = caller->continue();
                if (result is error) {
                    log:printError("Error sending response", 'error = result);
                }

            } else {
                http:Response resp = new;
                resp.statusCode = http:STATUS_EXPECTATION_FAILED;
                resp.setPayload("Unprocessable Entity");
                check caller->respond(resp);
            }
        }

        var payload = request.getTextPayload();
        if (payload is string) {
            log:printInfo(payload);
            check caller->respond("Hello World!\n");
        } else {
            http:Response resp = new;
            resp.statusCode = http:STATUS_INTERNAL_SERVER_ERROR;
            resp.setPayload(payload.message());
            check caller->respond(resp);
        }
    }
}