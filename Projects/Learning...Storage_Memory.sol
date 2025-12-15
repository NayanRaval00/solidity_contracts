// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract StorageMemory {
    string[] public student = ["Nayan", "Aakash", "Vivek"];

    function Memory() public view returns(string[] memory) {
        string[] memory s1   = student;
        s1[0] = "Darpan";
        return  s1;
    }

    function Storage() public {
        string[] storage s1 = student;
        s1[0] = "Darpan";
    }
}
