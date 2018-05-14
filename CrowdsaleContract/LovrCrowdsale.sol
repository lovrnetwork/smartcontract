pragma solidity ^0.4.23;

import "./distribution/RefundableCrowdsale.sol";
import "./validation/WhitelistedCrowdsale.sol";

contract LovrCrowdsale is WhitelistedCrowdsale, RefundableCrowdsale {
    
    constructor(uint256 _rate, address _wallet, ERC20 _token, uint256 _goal, uint256 _openingTime, uint256 _closingTime) public 
        Crowdsale(_rate, _wallet, _token)
        RefundableCrowdsale(_goal)
        TimedCrowdsale(_openingTime, _closingTime)
    {
        
    }
}