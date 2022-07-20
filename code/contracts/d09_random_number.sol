// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


contract RandomNumber {
    uint32 private guess = 0;
    string private fail = "Wrong number";
    string private success = "Success";


    constructor() {
        guess = uint32(uint256(keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp))));
    }

    function guessTheNumber(uint32 _guess) public view returns(string memory){
        if (_guess == guess) {
            return success;
        }else {
            return fail;
        }
    }
}
