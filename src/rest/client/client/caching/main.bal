import ballerina/http;

http:Client cachingEP = checkpanic new ("http://localhost:8080",
                        {cache: {enabled: true, isShared: true}});
service / on new http:Listener(9090) {

    resource function get cache(http:Request req)
            returns http:Response|error? {
        http:Response response = check cachingEP->forward("/hello", req);

        return response;
    }
}

service / on new http:Listener(8080) {

    resource function 'default hello() returns http:Response {
        http:Response res = new;

        http:ResponseCacheControl resCC = new;

        resCC.maxAge = 15;
        resCC.mustRevalidate = true;
        resCC.isPrivate = false;
        res.cacheControl = resCC;
        json payload = {"message": "Hello, World!"};

        res.setETag(payload);

        res.setLastModified();

        res.setPayload(payload);

        return res;

    }
}