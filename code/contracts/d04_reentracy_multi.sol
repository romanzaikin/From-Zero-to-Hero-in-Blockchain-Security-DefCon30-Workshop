// SPDX-License-Identifier: MIT
pragma solidity 0.7.0;

import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";


contract SmallBankMulti is ReentrancyGuard {
    mapping(address => uint) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function transfer(address to, uint amount) external {
        if (balances[msg.sender] >= amount) {
           balances[to] += amount;
           balances[msg.sender] -= amount;
        }
    }

    function withdraw() external nonReentrant {
        uint bal = balances[msg.sender];

        require(bal > 0, "No balance to withdraw");
        (bool sent, ) = msg.sender.call{value: bal}("");

        balances[msg.sender] = 0;
    }

    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }
}