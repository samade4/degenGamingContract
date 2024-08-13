# DegenGaming Smart Contract

This is a Solidity smart contract written to create an ERC20 token called DegenToken for Degen Gaming 🎮. A Unique token that can reward players and take their game to the next level. Tokens that can be earned by players in their game and then exchanged for rewards in their in-game store. A smart step towards increasing player loyalty and retention 🧠. The contract inherits @openzeppelin/contracts/token/ERC20/ERC20.sol. It includes functionalities for minting, burning, and transferring tokens. It is designed to be deployed on the Avalanche Testnet (Fuji) blockchain.


## Features

1. ERC20 Compatibility: DegenToken implements the ERC20 standard, allowing seamless integration with other Ethereum-based platforms and wallets.

2. Minting: The contract owner has the ability to mint new Degen tokens and allocate them to specific addresses.

3. Burning: Users can burn their Degen tokens, effectively removing them from circulation.

4. Item Redemption: Users can redeem in-game items using their Degen tokens. Each item has a specified price in Degen tokens.

5. Ownership: The contract utilizes the Ownable contract from OpenZeppelin, enabling ownership management functionalities.


### Functionality

1. Minting

The mint function allows the contract owner to mint new Degen tokens and assign them to a specific address.
Only the contract owner can call this function.

2. Redeeming Items

Users can redeem in-game items using their Degen tokens through the redeemItem function.
Each item has a predefined price in Degen tokens.
Users must have sufficient Degen token balance to redeem an item.
Upon successful redemption, the corresponding amount of Degen tokens is transferred to the contract, and the user's balance is updated.

3. Transferring Degen Tokens

Users can transfer their Degen tokens to other addresses using the transferDGNToken function.
Users must have sufficient Degen token balance to perform the transfer.

4. Burning Tokens

Users can burn their Degen tokens, reducing the total supply.
The burn function allows users to burn a specific amount of Degen tokens from their balance.

5. Balance Inquiry

The getBalance function enables users to check their Degen token balance.


### Deployment Information

Contract Address: 0x7755BAA4376a5a3bC483dc2deED3e16Eb20f4EDA

Compiler Version: Solidity 0.8.9

License: MIT License (SPDX-License-Identifier: MIT)

Snowtrack-link: https://testnet.snowtrace.io/token/0x30D4af7dAB5F563ac9e4c1B0c8BacacbA14C3DC5?chainId=43113


## Authors
Adedayo Samuel



## Loom(video) walkthrough
```bash
https://www.loom.com/share/8bb51c917951457dbffbfb89c0d468de?sid=f41ed829-65a2-417a-8f50-bb68255e170b
```

### Disclaimer

This contract is provided as-is without any warranties or guarantees. Use it at your own risk. Make sure to review and test the contract thoroughly before deploying it to the Avalanche mainnet or any other production environment.