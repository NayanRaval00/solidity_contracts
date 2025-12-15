// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract PayEather {
    address payable user = payable (0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);

    function payEather() public payable {}

    function getAccountBalance() public view returns (uint) {
        return address(this).balance;
    }

    function sendEather() public {
        user.transfer(1 ether);
    }
}
