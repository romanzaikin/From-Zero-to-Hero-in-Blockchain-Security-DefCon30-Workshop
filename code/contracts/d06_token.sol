pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ORDToken is ERC20 {
    // Decimals are set to 18 by default in `ERC20`
    constructor() public ERC20("OdedRomanDiklaToken", "ORD") {
        _mint(msg.sender, 2**256 - 1);
    }

    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        address owner = _msgSender();
        // ERC20: transfer to the zero address not allowed
         if(to != address(0)) {
            _transfer(owner, to, amount);
         }
        return true;
    }
}