//SPDX-License-Identifier: MIT

pragma solidity ^0.8.22;

import {MyToken} from "./MyToken.sol";

contract WrappedToken is MyToken {
    constructor(
        string memory tokenName,
        string memory tokenSymbol
    ) MyToken(tokenName, tokenSymbol) {}

    function mintTokenWithSpecificTokenId(
        address to,
        uint256 tokenId
    ) public onlyOwner returns (uint256) {
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, META_DATA);
        return tokenId;
    }

    function burnToken(uint256 tokenId) public onlyOwner {
        _burn(tokenId);
    }

    function transferToken(
        address from,
        address to,
        uint256 tokenId
    ) public onlyOwner {
        _transfer(from, to, tokenId);
    }

    function approveToken(address to, uint256 tokenId) public onlyOwner {
        _approve(to, tokenId);
    }
}
