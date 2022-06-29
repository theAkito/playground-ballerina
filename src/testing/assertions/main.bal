import ballerina/test;

@test:Config { }
function testAssertEquals() {
    json a = {name:"John Doe", age:25, address:{city:"Colombo", 
    country:"Sri Lanka"}};
    json b = {name:"John Doe", age:25, address:{city:"Colombo", 
    country:"Sri Lanka"}};

    test:assertEquals(a, b, msg = "JSON values are not equal");
}

@test:Config { }
function testAssertNotEquals() {
    string s1 = "abc";
    string s2 = "def";

    test:assertNotEquals(s1, s2, msg = "String values are equal");
}

@test:Config { }
function testAssertTrue() {
    boolean value = true;

    test:assertTrue(value, msg = "AssertTrue failed");
}

@test:Config { }
function testAssertFalse() {
    boolean value = false;

    test:assertFalse(value, msg = "AssertFalse failed");
}

@test:Config { }
function testAssertFail() {
    boolean flag = true;
    if (flag) {
        return;
    }

    test:assertFail(msg = "AssertFailed");
}

class Person {
    public string name = "";
    public int age = 0;
    public Person? parent = ();
    private string email = "default@abc.com";
    string address = "No 20, Palm grove";
}

@test:Config { }
function testAssertExactEquals() {
    Person person1 = new;
    Person person2 = person1;

    test:assertExactEquals(person1, person2,
        msg = "Objects are not exactly equal");
}

@test:Config { }
function testAssertNotExactEquals() {
    Person person1 = new;
    Person person2 = new;

    test:assertNotExactEquals(person1, person2,
        msg = "Objects are exactly equal");
}