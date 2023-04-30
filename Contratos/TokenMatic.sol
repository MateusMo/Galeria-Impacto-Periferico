// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MaticInteraction is Ownable {

    IERC20 public MaticContrato;

    constructor (address _maticContrato){
        MaticContrato = IERC20(_maticContrato);
    }

    function transferMatic(address _to, uint256 _amount) public onlyOwner{
        require(_to != address(0) && _to != address(this), "Invalid recipient address");
        require(_amount > 0, "Invalid amount");
        require(MaticContrato.balanceOf(address(this)) >= _amount, "Insufficient balance");

        MaticContrato.transfer(_to, _amount);
    }

    function checkMaticBalance() public view returns (uint256) {
        return MaticContrato.balanceOf(address(this));
    }

    function withdrawMatic() public onlyOwner {
        uint256 balance = MaticContrato.balanceOf(address(this));
        require(balance > 0, "Insufficient balance");
        MaticContrato.transfer(owner(), balance);
    }
   
}

//contrato: 0xcba892ca9fbaeb401f435820bb5860e4b1a4c4e8

