const Migrations = artifacts.require("BadgerVotingShareTest1");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
};
