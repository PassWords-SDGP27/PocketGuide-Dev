// SPDX-License-Identifier:MIT

pragma solidity ^0.8.7;

contract Location {

    //Struct for Location
    struct LocationStruct {
        string locationName;
        string locationDesc;
    }

    LocationStruct[] public locations;//array to store locations

    //Add new location function
    function addLocation(string memory _locationName, string memory _locationDesc) external {
        locations.push(LocationStruct(_locationName, _locationDesc)); //add new location to the locations array
    }
}