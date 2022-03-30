import 'package:flutter/material.dart';

class HomePage  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('Assets/images/bluebackground.jpg'),
                      fit: BoxFit.fill
                  )
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 50,
                    left: 110,
                    width: 200,
                    height: 200,
                    child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('Assets/images/logo.png')
                            )
                        )
                    ),
                  ),
                  Positioned(
                    child: Container(
                      margin: EdgeInsets.only(top: 250),
                      child: Center(
                        child: Text("LOGIN", style: TextStyle(color: Colors.blueGrey[800], fontSize: 30, fontWeight: FontWeight.bold),),
                      ),
                    ),
                  )

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(143, 148, 251, .2),
                              blurRadius: 20.0,
                              offset: Offset(0,10)
                          )
                        ]
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: (Colors.blue[300])!))
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email or Phone Number",
                                hintStyle: TextStyle(color: Colors.grey[400])
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey[400])
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height:30,),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(143, 148, 251, 1),
                              Color.fromRGBO(143, 148, 251, .6),
                            ]
                        )
                    ),
                    child: Center(
                      child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),),
                  SizedBox(height: 20,),
                  Text("Sign In", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}