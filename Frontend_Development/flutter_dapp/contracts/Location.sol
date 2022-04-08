// SPDX-License-Identifier:MIT

pragma solidity ^0.8.7;

contract Location {

    //Struct for Location
    struct LocationStruct {
        string locationName;
        string locationDesc;
        string longLat;
    }

    LocationStruct[] public locations;//array to store locations

    //Add new location function
    function addLocation(string memory _locationName, string memory _locationDesc, string memory _longLat) external {
        locations.push(LocationStruct(_locationName, _locationDesc, _longLat)); //add new location to the locations array
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
        if (!(locId >= locations.length)){
            return locations[locId].locationDesc;
        }
        return "Locaton not found!";
    }

    //returns location name
    function viewLocationName  () external view returns (string memory){
        return locations[0].locationName;
    }

    function viewLongLat (string memory _locationName) external view returns (string memory){
        uint locId = findLocation(_locationName);
        if (!(locId >= locations.length)){
            return locations[locId].longLat;
        }
        return "Location not found!";
    }


    //Delete a location from locations array
    function deleteLocation (string memory _locName) external {
        uint locId = findLocation(_locName);

        if (!(locId >= locations.length)){
            delete locations[locId];
        }
    }

    function viewAllLocations() external view returns(LocationStruct[] memory) {
        return locations;
    }

    //Function that validates a user input as a new loation
    function verifyLocation(int longitude, int latitude, string memory locationName) external view{

    }
}