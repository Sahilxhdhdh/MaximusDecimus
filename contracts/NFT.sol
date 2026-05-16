// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NFTMint {

    struct NFT {

        uint tokenId;
        string metadata;
        address owner;
    }

    NFT[] public nfts;

    function mintNFT(
        uint _tokenId,
        string memory _metadata
    ) public {

        nfts.push(
            NFT(
                _tokenId,
                _metadata,
                msg.sender
            )
        );
    }

    function transferNFT(
        uint index,
        address newOwner
    ) public {

        require(
            nfts[index].owner == msg.sender,
            "Not NFT Owner"
        );

        nfts[index].owner = newOwner;
    }

    function getNFT(uint index)
    public
    view
    returns(
        uint,
        string memory,
        address
    ) {

        NFT memory n = nfts[index];

        return (
            n.tokenId,
            n.metadata,
            n.owner
        );
    }
}