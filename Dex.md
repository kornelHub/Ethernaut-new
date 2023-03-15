Firstly we need to approve contract to swap token
```
await contract.approve('DEX_ADDRESS', '10000000000000000000')
```

Token1: `0xA091A2C908908e86e9D22562679516AaB4A80c2e`
Token2: `0x7e503b74ef5e5E8Ede71ac767c9CF12737470418`

Later we need swap all our tokens and repeat this process till dex contract have 0 balance of one of tokens.
```
await contract.swap('0xA091A2C908908e86e9D22562679516AaB4A80c2e', '0x7e503b74ef5e5E8Ede71ac767c9CF12737470418', 10) // 1
await contract.swap('0x7e503b74ef5e5E8Ede71ac767c9CF12737470418', '0xA091A2C908908e86e9D22562679516AaB4A80c2e', 20) // 2
await contract.swap('0xA091A2C908908e86e9D22562679516AaB4A80c2e', '0x7e503b74ef5e5E8Ede71ac767c9CF12737470418', 24) // 3
await contract.swap('0x7e503b74ef5e5E8Ede71ac767c9CF12737470418', '0xA091A2C908908e86e9D22562679516AaB4A80c2e', 30) // 4
await contract.swap('0xA091A2C908908e86e9D22562679516AaB4A80c2e', '0x7e503b74ef5e5E8Ede71ac767c9CF12737470418', 41) // 5
await contract.swap('0x7e503b74ef5e5E8Ede71ac767c9CF12737470418', '0xA091A2C908908e86e9D22562679516AaB4A80c2e', 45) // 6
```
In 6 Tx we can't swap all of pur tokens cuz dex doesnt have that much. If we wanted to swap 65 T2 -> T1, contract formula would calculate
`65 * 110 / 45 = 158` tokens. So lower value needed to be swaped.


| Tx number | My T1 balance | My T2 balance | Dex T1 balance | Dex T2 balance |
| ----------| ------------- | ------------- | -------------- | -------------- |
| 0         | 10            | 10            | 100            | 100            |
| 1         | 0             | 20            | 110            | 90             |
| 2         | 24            | 0             | 86             | 110            |
| 3         | 0             | 30            | 110            | 80             |
| 4         | 41            | 0             | 69             | 110            |
| 5         | 0             | 65            | 110            | 45             |
| 6         | 110           | 20            | 0              | 90             |
