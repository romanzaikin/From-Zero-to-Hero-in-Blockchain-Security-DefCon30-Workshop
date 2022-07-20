// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


contract SmallBankSingle {
    mapping(address => uint) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint bal = balances[msg.sender];

        require(bal > 0, "No balance to withdraw");
        (bool sent, ) = msg.sender.call{value: bal}("");

        balances[msg.sender] = 0;
    }

    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }
}


