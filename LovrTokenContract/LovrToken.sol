pragma solidity ^0.4.23;

import "./StandardBurnableToken.sol";

contract LovrToken is StandardBurnableToken {
    
    string public name;
    string public symbol;
    uint8 public decimals;

    constructor(uint256 totalSupply, string _name, string _symbol, uint8 _decimals) public {
    name = _name;
    symbol = _symbol;
    decimals = _decimals;
    totalSupply_ = totalSupply * 10 ** uint(_decimals);
    balances[msg.sender] = totalSupply * 10 ** uint(_decimals);
    emit Transfer(0x0, msg.sender, totalSupply * 10 ** uint(_decimals));
    }
}
