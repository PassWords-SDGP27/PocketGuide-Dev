const Location = artifacts.require("Location");
const User = artifacts.require("User");

module.exports = function (deployer) {
  deployer.deploy(Location);
  deployer.deploy(User);
};