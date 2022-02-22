pragma solidity ^0.4.0;

contract User {
    event NewUser(string username);//inform frontend that new user was created

    string public username;
    //Other required fields?

    function createUser(string memory _username) private {
        username = _username;
        emit NewUser(_username);//fire the event
    }
}
