pragma solidity ^0.4.23;

import "../crowdsale/distribution/RefundableCrowdsale.sol";
import "../crowdsale/validation/WhitelistedCrowdsale.sol";
import "../crowdsale/emission/AllowanceCrowdsale.sol";
import "../crowdsale/distribution/PostDeliveryCrowdsale.sol";
import "../crowdsale/validation/CappedCrowdsale.sol";

contract LovrCrowdsale is WhitelistedCrowdsale, RefundableCrowdsale, AllowanceCrowdsale, PostDeliveryCrowdsale, CappedCrowdsale {
    
    uint256 boughtTokens = 0;
    
    constructor(uint256 _rate, address _wallet, ERC20 _token, uint256 _goal, uint256 _openingTime, uint256 _closingTime, uint256 _cap) public 
        Crowdsale(_rate, _wallet, _token)
        RefundableCrowdsale(_goal)
        TimedCrowdsale(_openingTime, _closingTime)
        AllowanceCrowdsale(_wallet)
        CappedCrowdsale(_cap)
    {
        
    }
    
    function remainingTokens() public view returns (uint256) {
        require(token.allowance(tokenWallet, this) >= boughtTokens);
        return token.allowance(tokenWallet, this) - boughtTokens;
  }
  
  function withdrawTokens() public {
      require(goalReached());
      super.withdrawTokens();
  }
  
  function _processPurchase(
    address _beneficiary,
    uint256 _tokenAmount
  )
    internal
  {
    boughtTokens += _tokenAmount;
    super._processPurchase(_beneficiary, _tokenAmount);
  }
}