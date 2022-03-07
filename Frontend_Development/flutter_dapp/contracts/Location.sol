// SPDX-License-Identifier:MIT

pragma solidity ^0.8.11;

contract Location {
    event NewLocation(uint locationId, string name);

    //string locationName;

    struct Location{
        string locationName;
    }

    //array to store all locations
    Location[] public locations;

    //map to store which user added each location
    mapping (uint => address) public locationToAdduser;
    mapping (address => Location[]) locationsNew;

    function addLocation(string memory _name) public{
//        uint id = locations.push(Location(_name)) - 1;
        locationsNew[msg.sender].push(Location({locationName: _name}));
        //emit NewLocation(_name);
    }

    function deleteLocation (string memory _locName) external {
        uint locId = findLocation(_locName);

        if (locId != -1){
            delete locations[locId];
        }
    }


    function addDescription() public{

    }

    function editDescription() public{

    }

    function getLocation()public{

    }
}
