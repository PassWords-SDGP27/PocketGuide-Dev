pragma solidity ^0.8.11;

contract Location {
    event NewLocation(uint locationId, string name);

    string locationName;

    constructor(string _name) Location{
        locationName = name;
    }

    //array to store all locations
    Location[] public locations;

    //map to store which user added each location
    mapping (uint => address) public locationToAdduser;

    function addLocation(string memory _name) public{
        uint id = locations.push(Location(_name)) - 1;
        locationToAdduser[id] = msg.sender; //records which user added the location
        emit NewLocation(id, _name);
    }

    function removeLocation(address _address) public{
        locations.remove();
    }

    function addDescription() public{

    }

    function removeDescription() public{

    }

    function getLocation()public{

    }
}
