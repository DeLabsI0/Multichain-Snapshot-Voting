
pragma solidity ^0.8.0;

interface IERC20 {
    function totalSupply() external view returns (uint);
    function balanceOf(address account) external view returns (uint);
}

contract BadgerVotingShare {

    // btcb is the BSC bbadger-pegged coin. This address is for btcb.
    IERC20 constant btcb = IERC20(0x7130d2A12B9BCbFAe4f2634d864A1Ee1Ce3Ead9c);

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
        return btcb.totalSupply();
    }

    /*
        TODO: Count the votes in all places where btcb can be held.
        This includes staked supply and SETT deposited supply.
    */
    function _badgerBalanceOf(address _voter) internal view returns(uint) {
        return btcb.balanceOf(_voter);
    }

    function balanceOf(address _voter) external view returns (uint) {
        return _badgerBalanceOf(_voter);
    }

    constructor() {}
}