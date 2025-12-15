// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract VisibilityA {
    function A() public pure returns (uint) {
        return 1;
    }
    function B() private pure returns (uint) {
        return 2;
    }
    function C() internal pure returns (uint) {
        return 3;
    }
    function D() external pure returns (uint) {
        return 4;
    }
}

contract VisibilityB is VisibilityA {
    uint public abc = C();
}

contract VisibilityC {
    VisibilityA obj = new VisibilityA();
    uint public CX = obj.D();
}
