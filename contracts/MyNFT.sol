// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC721URIStorage, Ownable {
    uint256 public tokenCounter;
    mapping(uint256 => uint256) public tokenValues; // Store NFT values

    constructor() ERC721("MyNFT", "NFT") {
        tokenCounter = 0;
    }

    function mintNFT(string memory tokenURI) public onlyOwner {
        uint256 newItemId = tokenCounter;
        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        tokenValues[newItemId] = 1; // Initial value
        tokenCounter++;
    }

    function increaseValue(uint256 tokenId) public {
        require(ownerOf(tokenId) == msg.sender, "Not the owner");
        tokenValues[tokenId] += 1; // Increment value
    }

    function completeTask(uint256 tokenId) public {
        // Logic for task completion
        increaseValue(tokenId);
    }
}
