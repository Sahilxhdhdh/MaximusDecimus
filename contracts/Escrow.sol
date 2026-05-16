// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Escrow {

    address public buyer;
    address payable public seller;

    bool public buyerApproved;
    bool public sellerApproved;

    uint public releaseTime;

    constructor(address payable _seller) payable {

        buyer = msg.sender;
        seller = _seller;

        releaseTime = block.timestamp + 300;
    }

    function approveByBuyer() public {

        require(msg.sender == buyer);

        buyerApproved = true;
    }

    function approveBySeller() public {

        require(msg.sender == seller);

        sellerApproved = true;
    }

    function releasePayment() public {

        require(
            buyerApproved && sellerApproved
            || block.timestamp > releaseTime,
            "Conditions not satisfied"
        );

        seller.transfer(address(this).balance);
    }
}