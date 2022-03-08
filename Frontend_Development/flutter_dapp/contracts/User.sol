// SPDX-License-Identifier:MIT

pragma solidity ^0.8.7;

contract UserContract {

    struct User {
        uint id;
        string name;
        bool set; // This boolean is used to differentiate between unset and zero struct values
    }

    mapping(address => User) public users;

    function createUser(uint _userId, string memory _userName) public {
        address _userAddress = msg.sender;

        User storage user = users[_userAddress];

        require(!user.set); // Check that the user did not already exist:

        //Save user
        users[_userAddress] = User({
        id: _userId,
        name: _userName,
        set: true
        });
    }
}
