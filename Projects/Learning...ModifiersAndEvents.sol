// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract ModifiersAndEvents {

    address public owner;

    constructor() {
        owner = msg.sender; // the one who deploys is the owner
    }

    // -------- MODIFIER ----------
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    // -------- EVENT -------------
    event Transfer(address from, address to, uint amount);

    // -------- FUNCTION ----------
    function sendToken(address recipient, uint amount) public onlyOwner {
        // (no real token transfer, just example)
        emit Transfer(msg.sender, recipient, amount);
    }

}
