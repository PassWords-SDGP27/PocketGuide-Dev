const Location = artifacts.require("Location") ;

contract("Location" , () => {
    it("Location Testing" , async () => {
       const location = await Location.deployed();
       await location.addLocation("Colombo", "This is Colombo This is Colombo This is Colombo This is Colombo This is Colombo This is Colombo", "37.4219983-122.084");
       assert(await location.viewLocationName() === "Colombo");
       //assert(await user.email() === "testuser@gmail.com");
    });

});