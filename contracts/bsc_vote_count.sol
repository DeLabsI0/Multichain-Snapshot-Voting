// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

interface IERC20 {
    function totalSupply() external view returns (uint);
    function balanceOf(address account) external view returns (uint);
}

contract BadgerVotingShareTest1 {

    // bbadger is the BADGER token on BSC.
    // TODO: Right now we're using the address of USDC on BSC testnet to test our contract.
    IERC20 constant bbadger = IERC20(0x9780881Bf45B83Ee028c4c1De7e0C168dF8e9eEF);

    function decimals() external pure returns (uint8) {
        return uint8(18);
    }

    function name() external pure returns (string memory) {
        return "Badger Voting Share BSC";
    }

    function symbol() external pure returns (string memory) {
        return "Badger VS BSC";
    }

    function totalSupply() external view returns (uint) {
        return bbadger.totalSupply();
    }

    /*
        TODO: Count the votes in all places where bbadger can be held.
        This includes staked supply and SETT deposited supply.
    */
    function _badgerBalanceOf(address _voter) internal view returns(uint) {
        return bbadger.balanceOf(_voter);
    }

    function balanceOf(address _voter) external view returns (uint) {
        return _badgerBalanceOf(_voter);
    }

    constructor() {}
}