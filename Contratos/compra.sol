// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GaleriaGIP is Ownable {

    ERC721 public nftContrato;
    ERC20 public MaticContrato;

    uint256 public preconft;
    uint256 public qtNFTVendidos;

    address payable public vendedor;

    event Venda(address _comprador, uint256 _nftId);

    constructor (address _nftContrato, uint256 _precoNFT){
   
    require(_nftContrato != address(0)&& _nftContrato != address(this));
    require(_precoNFT > 0);

    nftContrato = ERC721(_nftContrato);
    MaticContrato = ERC20(0x0000000000000000000000000000000000001010); // Insira o endereço do contrato Matic aqui
    preconft = _precoNFT;
    }

    function compraNft(uint _nftId) public payable {
     
     vendedor = payable(nftContrato.ownerOf(_nftId));

     require(
         msg.value >= preconft
         );

    require(
         MaticContrato.transferFrom(msg.sender, vendedor, 1)
         );

       nftContrato.safeTransferFrom(vendedor, msg.sender, _nftId);
       qtNFTVendidos++;
       emit Venda(msg.sender,_nftId);
    }

    function alterarPreco(uint256 _novoPreco) public onlyOwner{
        require(_novoPreco > 0);
        preconft = _novoPreco;
    }

}

//contrato:0xe9A220E85B21077152986c5B25DE4339520d497e
