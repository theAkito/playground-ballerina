import ballerina/io;

public function main() {
    int[] nums = [1, 2, 3, 4];

    int[] numsTimes10 = from var i in nums

                        select i * 10;


    io:println(numsTimes10);

    int[] evenNums = from var i in nums
                     where i % 2 == 0
                     select i;

    io:println(evenNums);
}