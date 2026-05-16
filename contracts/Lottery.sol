// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {

    address public manager;
    string public winnerMessage;

    address public winner;

    address[] public players;

    constructor() {
        manager = msg.sender;
    }

    function buyTicket() public payable {

        require(
            msg.value == 100 wei,
            "Ticket price is 100 wei"
        );

        players.push(msg.sender);
    }

    function random() private view returns(uint) {

        return uint(
            keccak256(
                abi.encodePacked(
                    block.timestamp,
                    players.length
                )
            )
        );
    }

    function pickWinner() public {

    require(
        msg.sender == manager,
        "Only manager can pick winner"
    );

    require(
        players.length > 0,
        "No players"
    );

    uint index =
        random() % players.length;

    winner = players[index];

    winnerMessage = "Winner Selected";

    payable(winner).transfer(
        address(this).balance
    );

    players = new address[](0);
}

    function getPlayers()
    public
    view
    returns(address[] memory) {

        return players;
    }
}