pragma solidity ^0.4.18;

import "./ERC20Interface.sol";
import "./Owned.sol";

contract LovrToken  is ERC20Interface, Owned {

    string public symbol;
    string public  name;
    uint8 public decimals;
    uint public totalSupply;

    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;

    function LovrToken(uint256 initialAmount, uint8 _decimals, string tokenName, string tokenSymbol) public {
        balances[msg.sender] = initialAmount;               // Give the creator all initial tokens
        totalSupply = initialAmount;                        // Update total supply
        name = tokenName;                                   // Set the name for display purposes
        symbol = tokenSymbol;                               // Set the symbol for display purposes
        decimals = _decimals;
    }


    function totalSupply() public constant returns (uint) {
        return totalSupply - balances[address(0)];
    }

    function balanceOf(address tokenOwner) public constant returns (uint balance) {
        return balances[tokenOwner];
    }

    function transfer(address to, uint tokens) public returns (bool success) {
        require(balances[msg.sender] >= tokens);
        balances[msg.sender] -= tokens;
        balances[to] += tokens;
        Transfer(msg.sender, to, tokens);
        return true;
    }

    function allowance(address tokenOwner, address spender) public constant returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }


    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        require(balances[from] >= tokens && allowed[from][msg.sender] >= tokens);
        balances[from] -= tokens;
        balances[to] += tokens;
        allowed[from][msg.sender] -= tokens;
        Transfer(from, to, tokens);
        return true;
    }

    function approve(address spender, uint tokens) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        Approval(msg.sender, spender, tokens);
        return true;
    }
}