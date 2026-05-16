// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {

    address public admin;
    bool public votingActive;

    mapping(address => bool) public hasVoted;

    uint public candidate1Votes;
    uint public candidate2Votes;

    constructor() {
        admin = msg.sender;
    }

    function startVoting() public {
        require(msg.sender == admin, "Only admin can start voting");
        votingActive = true;
    }

    function endVoting() public {
        require(msg.sender == admin, "Only admin can end voting");
        votingActive = false;
    }

    function vote(uint candidate) public {

        require(votingActive == true, "Voting is not active");
        require(!hasVoted[msg.sender], "You have already voted");

        if(candidate == 1) {
            candidate1Votes++;
        }

        else if(candidate == 2) {
            candidate2Votes++;
        }

        hasVoted[msg.sender] = true;
    }

    function getWinner() public view returns(string memory) {

        if(candidate1Votes > candidate2Votes) {
            return "Candidate 1 Wins";
        }

        else if(candidate2Votes > candidate1Votes) {
            return "Candidate 2 Wins";
        }

        else {
            return "Tie";
        }
    }
}