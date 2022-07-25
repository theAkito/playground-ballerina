import ballerina/http;

service /sample on new http:Listener(9090) {

    resource function get path/[string foo](http:Request req) returns json {

        map<any> pathMParams = req.getMatrixParams("/sample/path");
        var a = <string>pathMParams["a"];
        var b = <string>pathMParams["b"];
        string pathMatrixStr = string `a=${a}, b=${b}`;

        map<any> fooMParams = req.getMatrixParams("/sample/path/" + foo);
        var x = <string>fooMParams["x"];
        var y = <string>fooMParams["y"];
        string fooMatrixStr = string `x=${x}, y=${y}`;
        json matrixJson = {"path": pathMatrixStr, "foo": fooMatrixStr};

        json responseJson = {
            "pathParam": foo,
            "matrix": matrixJson
        };

        return responseJson;
    }
}