My address: `0xd107AC5e5830BB95f880cA3b1270ccCdAA0A3c5e`

In ERC20 contract there is also posibility to transfer tokens using `transferFrom()`. This spend allowance so we must approve our address to be able to transfer.

```
await contract.approve('0xd107AC5e5830BB95f880cA3b1270ccCdAA0A3c5e' ,'1000000000000000000000000')
```
If our address has allowance, we can transfer tokens to other address (in this example to contract address)
```
await contract.transferFrom('0xd107AC5e5830BB95f880cA3b1270ccCdAA0A3c5e', '0x87F4a3d5d3f2374B1B8e37a24Ae6B507982A22A9', '1000000000000000000000000')
```
