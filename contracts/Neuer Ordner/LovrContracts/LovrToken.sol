pragma solidity ^0.4.23;

import "../token/ERC20/DetailedERC20.sol";
import "../token/ERC20/StandardBurnableToken.sol";

contract LovrToken is StandardBurnableToken, DetailedERC20 {
    

    constructor(uint256 totalSupply, string _name, string _symbol, uint8 _decimals) public
    DetailedERC20(_name, _symbol, _decimals)
    {
        totalSupply_ = totalSupply * 10 ** uint(_decimals);
        balances[msg.sender] = totalSupply * 10 ** uint(_decimals);
        emit Transfer(0x0, msg.sender, totalSupply * 10 ** uint(_decimals));
    }
}