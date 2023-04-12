// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract myContractMapping {
    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }

    mapping (uint => Person) public people;
    uint8 public peopleCount = 0; 

    // constructor() {
    //     peopleCount = 1;
    // }

    // function addPerson(string memory _firstName, string memory _lastName) public {
    //     peopleCount ++;
    //     people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    // }

    function addPerson(string memory _firstName, string memory _lastName) public returns(Person memory){
        peopleCount ++;
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);

        return people[peopleCount];
    }
}