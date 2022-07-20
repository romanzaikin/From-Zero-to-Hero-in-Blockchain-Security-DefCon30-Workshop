// SPDX-License-Identifier: MIT
pragma solidity 0.7.0;
import "@openzeppelin/contracts/math/SafeMath.sol";


contract Overflow {
    //using SafeMath for uint8;
    uint8 totalBalance;

    function addMoney(uint8 deposit) public payable{
        require(deposit == msg.value, "wrong amount");
        totalBalance += deposit;
        // totalBalance = totalBalance.add(deposit);
    }

    function getMoney() public view returns(uint8){
        return totalBalance;
    }
}
