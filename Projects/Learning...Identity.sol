// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract Identity {
    string public name;
    uint public age;

    constructor()  { 
        name="Nayan";
        age=25;
    }    

    function setAge() public  {
        age=age+1;
    }
}