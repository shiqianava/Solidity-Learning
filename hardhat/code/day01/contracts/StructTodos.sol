// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Todos {
    struct Todo {
        string text;
        bool completed;
    }

    // An array of 'Todo' structs
    Todo[] public todos;

    function create(string memory _text) public {

        // 3 ways to initialize a struct
        // - calling it like a function
        todos.push(Todo(_text, false));

        // key value mapping
        todos.push(Todo({text: _text, completed: false}));

        // initialize an empty struct and then update it
        Todo memory todo;
        todo.text = _text;
        // toto.completed initialized to false
        todos.push(todo);
    }

    // Solidity automatically created a getter for 'todos' so
    // you don't actually need this function
    function get(uint _index) public view returns (string memory text, bool completed) {
        // 如果数组中的结构体赋值给函数中声明的变量，使用memory修饰获得的是一个副本，也就是拷贝
        Todo memory todo = todos[_index];
        return (todo.text, todo.completed);
    }

    // update text
    function update(uint _index, string memory _text) public {
        // 如果使用storage修饰变量，那么得到的是一个引用，就是todo是指向 todos[_index] 的指针。修改后结构体数组中todos[_index]的数据会发生改名
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    // update completed
    function toggleCompleted(uint _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }

}


/* // Declaring and importing Struct
// File that the struct is declared in

struct Todo {
    string text;
    bool completed;
}

// File that import the struct above
import "./StructDeclartion.sol"

contract Todos {
    Todo[] public todos;
} */