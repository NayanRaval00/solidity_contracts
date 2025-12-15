// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract NestedMap {
    mapping(uint256 => mapping(uint256 => uint256)) public nestedMap;

    function setNestedMap(
        uint256 key1,
        uint256 key2,
        uint256 finalValue
    ) public {
        nestedMap[key1][key2] = finalValue;
    }

    function getNestedMap(
        uint256 key1,
        uint256 key2
    ) public view returns (uint256) {
        return nestedMap[key1][key2];
    }
}

contract TrackDebt {

    mapping(address => mapping(address => uint256)) public amountOwed;

    function setAmountOwed(
        address borrower, 
        address lender, 
        uint256 amount
    ) 
        public {
            amountOwed[lender][borrower] = amount;
    }
}
