// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

interface IERC20 {
    function totalSupply() external view returns (uint);
    function balanceOf(address account) external view returns (uint);
}

interface ISett {
    function totalSupply() external view returns (uint);
    function balanceOf(address owner) external view returns (uint);
    function getPricePerFullShare() external view returns(uint);
}

interface IPancakePair {
    function decimals() external pure returns (uint8);
    function totalSupply() external view returns (uint);
    function balanceOf(address owner) external view returns (uint);
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
}

contract BadgerVotingShareTest1 {

    IERC20 constant badger = IERC20(0x753fbc5800a8C8e3Fb6DC6415810d627A387Dfc9);
    ISett constant sett_badger = ISett(0x1F7216fdB338247512Ec99715587bb97BBf96eae);
    IPancakePair constant badger_BTC_Pancake = IPancakePair(0x5A58609dA96469E9dEf3fE344bC39B00d18eb9A5);

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
        return badger.totalSupply();
    }

    function _pancakeSwapBalanceOf(address _voter) internal view returns (uint) {
        (, uint112 reserve1, ) = badger_BTC_Pancake.getReserves();
        uint totalPancakeBalance = badger_BTC_Pancake.balanceOf(_voter);
        return totalPancakeBalance * reserve1 / badger_BTC_Pancake.totalSupply();
    }

    /*
        TODO: Count the votes in all places where badger can be held.
        This includes staked supply and SETT deposited supply.
    */
    function _badgerBalanceOf(address _voter) internal view returns(uint) {
        return badger.balanceOf(_voter);
    }

    function balanceOf(address _voter) external view returns (uint) {
        uint bBadgerPricePerShare = sett_badger.getPricePerFullShare();
        return _badgerBalanceOf(_voter)
            + sett_badger.balanceOf(_voter) * bBadgerPricePerShare / 1e18
            + _pancakeSwapBalanceOf(_voter);
    }

    constructor() {}
}