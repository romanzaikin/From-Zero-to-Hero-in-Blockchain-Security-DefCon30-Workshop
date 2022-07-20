// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract MainCalcCode {
//    address public mainAddress;
//    address public owner;
    uint256 public result;   // slot 0

    // don't forget the **view**
    function add(uint256 num1, uint256 num2) external view returns(uint256){
//        result = num1 + num2;
//        return (result);
        return (num1 + num2);
    }
}

contract DelegateCalc {
    address public mainAddress;
    address public owner;
    uint256 public result;

    constructor(address _mainAddress) {
        mainAddress = _mainAddress;
        owner = msg.sender;
    }

    function add(uint256 num1, uint256 num2) external returns (uint256){
        (bool success, bytes memory data) = mainAddress.delegatecall(msg.data);
        require(success, "error in delegatecall");

        return abi.decode(data, (uint256));
    }

}
