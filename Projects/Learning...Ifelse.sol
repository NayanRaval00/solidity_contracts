// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract IfElese {
    function IfeElseCheck(uint i) public pure returns (string memory) {
        string memory value;
        if (i > 0) {
            value = "0 Is Greter then 0";
        } else if (i == 0) {
            value = "Value is equal to 0";
        } else if (i < 0) {
            value = "0 Is Less then 0";
        } else {
            value = "0 is not a number";
        }
        return value;
    }
}
