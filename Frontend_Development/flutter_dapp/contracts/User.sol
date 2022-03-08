// SPDX-License-Identifier:MIT

pragma solidity ^0.8.7;

contract UserContract {

    struct User {
        string email;
        string username;
        string tellNo;
        bool set; // This boolean is used to differentiate between unset and zero struct values
    }

    mapping(address => User) public users;

    function createUser(string memory _email, string memory _username, string memory _tellNo) public {
        address _userAddress = msg.sender;

        User storage user = users[_userAddress];

        require(!user.set); // Check that the user did not already exist:

        //Save user
        users[_userAddress] = User({
        email: _email,
        username: _username,
        tellNo: _tellNo,
        set: true
        });
    }
    
}