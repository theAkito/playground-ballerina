import ballerina/http;

listener http:Listener securedEP = new(9090,
    secureSocket = {
        key: {
            certFile: "../resource/path/to/public.crt",
            keyFile: "../resource/path/to/private.key"
        },

        mutualSsl: {
            verifyClient: http:REQUIRE,
            cert: "../resource/path/to/public.crt"
        },

        protocol: {
            name: http:TLS,
            versions: ["TLSv1.2", "TLSv1.1"]
        },

        ciphers: ["TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA"]

    }
);

service /foo on securedEP {
    resource function get bar() returns string {
        return "Hello, World!";
    }
}