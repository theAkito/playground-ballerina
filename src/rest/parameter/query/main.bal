import ballerina/http;

service /product on new http:Listener(9090) {

    resource function get count(int a, int b) returns json {
        return { count : a + b};
    }

    resource function get name(string? id) returns string {
        if (id is string) {
            return "product_" + id;
        }
        return "product_0000";
    }

    resource function get detail(string[]? colour) returns json {
        return { product_colour : colour};
    }
}