// SPDX-License-Identifier:MIT

pragma solidity ^0.8.7;

contract UserContract {

    struct User {
        string email;
        string username;
        string password;
        string tellNo;
        bool set; // This boolean is used to differentiate between unset and zero struct values
        bool isUserLoggedIn; //login status of user
    }

    mapping(address => User) public users;

    function createUser(string memory _email, string memory _username, string memory _password, string memory _tellNo) public {
        address _userAddress = msg.sender;

        User storage user = users[_userAddress];

        require(!user.set); // Check that the user did not already exist:

        //Save user
        users[_userAddress] = User({
        email: _email,
        username: _username,
        password: _password,
        tellNo: _tellNo,
        set: true,
        isUserLoggedIn: false
        });
    }

    function login(string memory _password) external view returns (bool){
        User memory _user = users[msg.sender];
        if(keccak256(abi.encodePacked((_user.password))) == keccak256(abi.encodePacked((_password)))){
            _user.isUserLoggedIn = true;
            return _user.isUserLoggedIn;
        }
        else{
            return false;
        }
    }

    function logout() external {
        users[msg.sender].isUserLoggedIn = false;
    }
}