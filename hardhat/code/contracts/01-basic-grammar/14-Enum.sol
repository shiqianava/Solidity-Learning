// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

//Solidity supports enumerables and they are useful to model choice and keep track of state. 主要建模选择和状态跟踪
//Enums can be declared outside of a contract.
contract Enum {
    // Enum representing shipping status
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    Status public status;

    function get() public view returns (Status) {
        return status;
    }

    function set(Status _status) public {
        status = _status;
    }

    // You can update to a specific enum like this
    function cancel() public {
        status = Status.Canceled;
    }

    //delete resets the enum to its first value, 0
    function reset() public {
        delete status;
    }
}

// Declaring and importing Enum
// File that the enum is declared in 
/*
enum Status {
    Pending,
    Shipping,
    Accepted,
    Rejected,
    Canceled
}
*/

// File that imports the enum above
/*
import "./EnumDeclaration.sol";

contract Enum {
    Status public status;
}
*/