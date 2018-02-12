var LovrToken = artifacts.require("./LovrToken.sol");

module.exports = function(deployer) {
  deployer.deploy(LovrToken, 100000, 3, "LovrToken", "Lvr");
};
