// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract ByteArray2 {
    bytes public bi2 = "aBc"; //2 bytes array

    function setValueInArray() public {
        bi2 = "Ab";
    }

    function pushElememt() public {
        bi2.push("a");
    }

    function getElement(uint i) public view returns (bytes1) {
        return bi2[i];
    }

    function getElementLength() public view returns (uint) {
        return bi2.length;
    }
}
