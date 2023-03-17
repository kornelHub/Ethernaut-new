// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

interface IDetectionBot {
    function handleTransaction(address, bytes calldata) external;
}

interface IForta {
    function setDetectionBot(address) external;
    function notify(address, bytes calldata) external;
    function raiseAlert(address) external;
}

interface CryptoVault {
    function sweptTokensRecipient() external view returns(address);
    function underlying() external view returns(IERC20);
}

// Firstly we need to have Forta and CryptoVault address
// We can get it from Level contract using await contract.forta() and await contract.cryptoVault()
// To deploy  DetectionBot we need to pass CryptoVault address
// After we deploy our DetectionBot we need to add it to Forta using setDetectionBot()
contract DetectionBot is IDetectionBot {
    address public vault;

    constructor(address _vault) {
        vault = _vault;
    }

    function handleTransaction(address user, bytes calldata msgData) external {
        address to;
        uint256 value;
        address origSender;
        // first four bytes go to function idenficator, if we slice it we have access to function arguments
        (to, value, origSender) = abi.decode(msgData[4:], (address,uint256,address));
        
        if (origSender == vault) {
            IForta(msg.sender).raiseAlert(user);
        }
    }
}
// CryptoVault: 0x5C56DBB0213794D3A4C35ee401Ed164C50510a44
// FORTA: 0x9f4dEb41c51a380FD1a85b918D75F718f8903514
