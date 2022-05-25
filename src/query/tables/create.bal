import ballerina/io;

type Employee record {|
    readonly int id;
    string firstName;
    string lastName;
    int salary;
|};

public function main() {
    table<Employee> key(id) employees = table [
        {id: 1, firstName: "John", lastName: "Smith", salary: 100},
        {id: 2, firstName: "Fred", lastName: "Bloggs", salary: 2000}
    ];

    var highPaidEmployees = table key(id) from var e in employees
                            where e.salary >= 1000
                            select e;

    io:println(highPaidEmployees);
}