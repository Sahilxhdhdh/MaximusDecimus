// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Crowdfunding {

    address public owner;
    uint public goal;
    uint public deadline;
    uint public totalFunds;

    mapping(address => uint) public donations;

    constructor(uint _goal, uint _duration) {
        owner = msg.sender;
        goal = _goal;
        deadline = block.timestamp + _duration;
    }

    function donate() public payable {

        require(block.timestamp < deadline, "Deadline passed");

        donations[msg.sender] += msg.value;
        totalFunds += msg.value;
    }

    function withdrawFunds() public {

        require(msg.sender == owner, "Only owner can withdraw");
        require(totalFunds >= goal, "Goal not reached");

        payable(owner).transfer(totalFunds);
    }

    function refund() public {

        require(block.timestamp > deadline, "Campaign still active");
        require(totalFunds < goal, "Goal reached");

        uint amount = donations[msg.sender];

        donations[msg.sender] = 0;

        payable(msg.sender).transfer(amount);
    }
}