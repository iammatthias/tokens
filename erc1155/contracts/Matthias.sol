// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.1.0/contracts/token/ERC1155/ERC1155.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.1.0/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.1.0/contracts/security/Pausable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.1.0/contracts/token/ERC1155/extensions/ERC1155Burnable.sol";

contract MatthiasV2Test is ERC1155, Ownable, Pausable, ERC1155Burnable {
    
    uint256 public constant MATTHIAS = 0;
    
    constructor() ERC1155("https://iammatthias.com/metadata/{id}.json") {
        _mint(msg.sender, MATTHIAS, 10**12, "");
    }

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(uint256 id, uint256 amount)
        public
        onlyOwner
    {
        _mint(msg.sender, id, amount, "");
    }

    function mintBatch(uint256[] memory ids, uint256[] memory amounts)
        public
        onlyOwner
    {
        _mintBatch(msg.sender, ids, amounts, "");
    }


    function _beforeTokenTransfer(address operator, address from, address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
    }
}
