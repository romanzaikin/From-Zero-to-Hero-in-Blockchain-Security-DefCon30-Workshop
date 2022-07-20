// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


contract MyData {
    address private owner = msg.sender;
    uint32 private age = 33;
    bytes32 private password;
    uint256 private constant constantData = 1337;
    uint256 private secret = 123;

    constructor(bytes32 _password) {
        password = _password;
    }
}