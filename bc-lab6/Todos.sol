// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.2 < 0.9.0;

contract Todos {
    
    struct Todo {
        string text;
        bool completed;
    }

    // An array of 'Todo' structs
    Todo[] public todosChawTask;

    function createFirstTask(string memory _text) public {
        // 3 ways to initialize a struct
        // calling it like a function, sequence is important
        todosChawTask.push(Todo(_text, false));

        // key value mapping
        //todosChawTask.push(Todo({completed: false, text: _text}));

        // initialize an struct and then update it
        //Todo memory todo;
        //todo.text = _text;
        // todo.completed initialized to false

        //todosChawTask.push(todo);
    }   

    // Solidity automatically created a getter for' todos' so
    // you don't actually need this function.
    function get(uint _index) public view returns (string memory text, bool completed)
    {
        //storage keyword because solidity dont have pointer
        Todo storage todo = todosChawTask[_index];
        return (todo.text, todo.completed);
    }

    // update text
    function updateNewTask(uint _index, string memory _text) public {
        Todo storage todo = todosChawTask[_index];
        todo.text = _text;
    }
    // update completed
    function toggleCompleted(uint _index) public {
        Todo storage todo = todosChawTask[_index];
        todo.completed = !todo.completed;
    }
}
