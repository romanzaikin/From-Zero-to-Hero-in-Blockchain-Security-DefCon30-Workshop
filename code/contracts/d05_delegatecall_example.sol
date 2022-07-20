// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


contract MainContract {
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
}

contract DelegateExample {
    mapping(address => uint) public balances;
    address public main;
    address public owner;

    constructor(address _mainAddress) {
        main = _mainAddress;
        owner = msg.sender;
    }

    fallback() external payable {
        (bool success, bytes memory data) = main.delegatecall(msg.data);
        require(success, "error in delegatecall");
    }
}
