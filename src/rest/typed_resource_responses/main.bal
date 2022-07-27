import ballerina/http;

type PersonAccount record {
    string name;
    int accountNo;
};

service /bank on new http:Listener(9090) {

    resource function get branch() returns
            @http:Payload {mediaType:"application/json+id"} json {
        return { branch : ["Colombo, Srilanka"]};
    }

    resource function get [string 'type]()
            returns http:Ok|http:InternalServerError {
        if 'type == "open" {

            http:Ok ok = {body: "Bank is open"};
            return ok;
        } else {

            http:InternalServerError err = {body: "Bank is closed"};
            return err;
        }
    }

    resource function put account(@http:Payload string name)
            returns record {|*http:Created; PersonAccount body;|} {
        PersonAccount account = {accountNo: 84230, name: name};
        return {
            mediaType: "application/account+json",
            headers: {
                "Location": "/myServer/084230"
            },
            body: account
        };
    }
}