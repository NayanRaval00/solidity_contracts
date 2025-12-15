// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract MappingStructure {
    struct student {
        string name;
        uint class;
    }

    mapping(uint => student) public data;

    function setteData(uint _roll, string memory _name, uint _class) public {
        data[_roll] = student(_name, _class);
    }

    function getBlocInfo()
        public
        view
        returns (uint block_no, uint timestamp, address sender)
    {
        return (block.number, block.timestamp, msg.sender);
    }
}
