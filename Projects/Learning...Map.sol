// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract Mapping {
    mapping(uint => string) public roll_number;

    function settValues(uint roll_no, string memory name) public {
        roll_number[roll_no] = name;
    }
}
