// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TodoList {

    struct Task {
        string taskText;
        bool completed;
    }

    mapping(address => Task[]) public tasks;

    function addTask(string memory _taskText) public {

        tasks[msg.sender].push(Task(_taskText, false));
    }

    function updateTask(uint index, string memory _newText) public {

        tasks[msg.sender][index].taskText = _newText;
    }

    function markCompleted(uint index) public {

        tasks[msg.sender][index].completed = true;
    }

    function getTask(uint index) public view returns(string memory, bool) {

        Task memory task = tasks[msg.sender][index];

        return (task.taskText, task.completed);
    }
    
    function getAllTasks() public view returns(Task[] memory) {

    return tasks[msg.sender];
}
}