// SPDX-License-Identifier:MIT

pragma solidity ^0.8.7;

contract User {

    struct UserStruct {
        string email;
        string username;
        string password;
        string tellNo;
        bool set; // This boolean is used to differentiate between unset and zero struct values
        bool isUserLoggedIn; //login status of user
    }

    mapping(address => UserStruct) public users;

    function createUser(string memory _email, string memory _username, string memory _password, string memory _tellNo) public {
        address _userAddress = msg.sender;

        UserStruct storage user = users[_userAddress];

        require(!user.set); // Check that the user did not already exist:

        //Save user
        users[_userAddress] = UserStruct({
        email: _email,
        username: _username,
        password: _password,
        tellNo: _tellNo,
        set: true,
        isUserLoggedIn: false
        });
    }

    function login(string memory _password) external view returns (bool){
        UserStruct memory _user = users[msg.sender];
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

    function username() external view returns (string memory){
        return users[msg.sender].username;
    }
}