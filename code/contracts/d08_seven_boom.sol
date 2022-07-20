// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


contract SevenBoom {
    uint public target = 7 ether;
    address public winner;

    function play() public payable {
        require(msg.value == 1 ether, "You can only send 1 Ether");

        uint balance = address(this).balance;
        require(balance <= target, "Game is over");

        if (balance == target) {
            winner = msg.sender;
        }
    }

    function claimReward() public {
        require(msg.sender == winner, "Not winner");

        (bool sent, ) = msg.sender.call{value: address(this).balance}("");
        require(sent, "Failed to send Ether");
    }
}
