// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

struct Student {
    uint roll;
    string name;
}

contract Structure {
    Student public s1;

    constructor(uint _roll, string memory _name) {
        s1.roll = _roll;
        s1.name = _name;
    }

    function ChangeValues(uint _roll, string memory _name) public  {
        Student memory newStudent = Student({
            roll:_roll,
            name:_name
        });

        s1=newStudent;
    }
}
