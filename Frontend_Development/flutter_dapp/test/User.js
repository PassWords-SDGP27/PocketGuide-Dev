const User = artifacts.require("User") ;

contract("User" , () => {
    it("User Testing" , async () => {
       const user = await User.deployed() ;
       await user.createUser("testuser@gmail.com", "testuser", "testPassword", "0777777777");
       const result = await user.username() ;
       assert(result === "chithzz") ;
    });
});