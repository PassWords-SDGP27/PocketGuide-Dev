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

    //Function returns array index of location if location exists, else returns size of array
    function findLocation (string memory _locationName) public view returns (uint){
        for (uint i=0; i<locations.length; i++){
            //check if current location name is equal to find location name
            if(keccak256(abi.encodePacked((locations[i].locationName))) == keccak256(abi.encodePacked((_locationName)))){ //comparing two strings
                return i;//then return array index of location
            }
        }
        return locations.length;//return size of array if location name NOT FOUND
    }

    //Returns description of relevant location
    function viewDesc (string memory _locationName) external view returns (string memory){
        uint locId = findLocation(_locationName);
        require(!(locId >= locations.length), "location not found!");
        return locations[locId].locationDesc;
    }
}