// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SubscriptionService {

    uint public subscriptionFee = 100 wei;
    uint public duration = 300;

    mapping(address => uint) public subscribers;

    function subscribe() public payable {

        require(
            msg.value >= subscriptionFee,
            "Insufficient Fee"
        );

        subscribers[msg.sender] =
            block.timestamp + duration;
    }

    function checkAccess()
    public
    view
    returns(bool) {

        return
            block.timestamp <
            subscribers[msg.sender];
    }
}