```
  // 0 slot
  bool public locked = true;
  // 1 slot
  uint256 public ID = block.timestamp;
  // 2 slot
  uint8 private flattening = 10;
  uint8 private denomination = 255;
  uint16 private awkwardness = uint16(block.timestamp);
  // 3,4,5 slots
  bytes32[3] private data;
  ```
  
  To get key needed to unlock we need access `data[2]`
  ```
  await web3.eth.getStorageAt(instance, 5) //0xa2fbbcde20f533bc4dbd1c327f582860fe0e12dec0651cc69b87642a89b9ac62
  ```
  Convert it to `bytes[16]`:
  ```
  0xa2fbbcde20f533bc4dbd1c327f582860
  ```
  
  Last step is to call:
  ```
  await contract.unlock('0xa2fbbcde20f533bc4dbd1c327f582860')
  ```
