// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "https://github.com/0xcert/ethereum-erc721/src/contracts/tokens/nf-token-metadata.sol";
import "https://github.com/0xcert/ethereum-erc721/src/contracts/ownership/ownable.sol";


contract newNFT is NFTokenMetadata, Ownable {
 
 constructor() {
   nftName = "Galeria Impacto Peliferico";
   nftSymbol = "GIP";
    }
  }

  //endereço:0xebb3b3648e8b64c7b85daafdd3bd30d8da2830f5
