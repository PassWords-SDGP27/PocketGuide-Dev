import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({Key key}) : super(key: key);

  @override
  _LoginSignUpScreenState createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  bool isMale = true;
  bool isSignupScreen = true;
  bool isRememberMe = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  alignment: Alignment.centerRight,
                  image: AssetImage("images/logo-removebg-preview.png"),
                )),
                child: Container(
                  padding: EdgeInsets.only(top: 90, left: 20),
                  color: Colors.blue[200].withOpacity(.90),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      RichText(
                          text: TextSpan(
                              text: "Welcome to  ",
                              style: TextStyle(
                                  fontSize: 20,
                                  letterSpacing: 2,
                                  color: Colors.yellow[600]),
                              children: [
                            TextSpan(
                              text: isSignupScreen ? "Pocket Guide," : "Back",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.yellow[600]),
                            )
                          ])),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        isSignupScreen
                            ? "Sign up to Continue"
                            : "Signin to continue ",
                        style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 17,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              )),
          //Main Container for Sign up and Login
          AnimatedPositioned(
              duration: Duration(milliseconds: 700),
              top: isSignupScreen ? 200 : 230,
              child: AnimatedContainer(
                duration: Duration(microseconds: 900),
                curve: Curves.bounceInOut,
                padding: EdgeInsets.all(20),
                height: isSignupScreen ? 400 : 306,
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 15,
                          spreadRadius: 7)
                    ]),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSignupScreen = false;
                                });
                              },
                              child: Column(
                                children: [
                                  Text(
                                    "LOGIN",
                                    style: TextStyle(
                                        fontSize: 16,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold,
                                        color: isSignupScreen
                                            ? Colors.grey
                                            : Colors.black),
                                  ),
                                  if (!isSignupScreen)
                                    Container(
                                      margin: EdgeInsets.only(top: 4),
                                      height: 2,
                                      width: 55,
                                      color: Colors.orange,
                                    )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSignupScreen = true;
                                });
                              },
                              child: Column(
                                children: [
                                  Text(
                                    "SIGNUP",
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: isSignupScreen
                                            ? Colors.black
                                            : Colors.grey),
                                  ),
                                  if (isSignupScreen)
                                    Container(
                                      margin: EdgeInsets.only(top: 4),
                                      height: 2,
                                      width: 55,
                                      color: Colors.orange,
                                    )
                                ],
                              ),
                            ),
                          ]),
                      if (isSignupScreen) buildSignUpSection(),
                      if (!isSignupScreen) buildSigningSection()
                    ],
                  ),
                ),
              )),
//the submit button
          //TODO button inserting
          AnimatedPositioned(
              duration: Duration(milliseconds: 900),
              top: isSignupScreen ? 555 : 485,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  height: 90,
                  width: 90,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 3))
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.3),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 3))
                        ],
                        gradient: LinearGradient(
                            colors: [Colors.orange[200], Colors.red[400]],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ),
              )),

          //bottom buttons
          Positioned(
              top: MediaQuery.of(context).size.height - 110,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Text(
                    isSignupScreen ? " Or signup with " : "Or Signin with",
                    style: TextStyle(
                      letterSpacing: 0.3,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20, left: 20, top: 15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.all(15),
                              side: BorderSide(width: 1, color: Colors.white38),
                              minimumSize: Size(50, 2),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80)),
                              primary: Colors.white,
                              backgroundColor: Colors.blueAccent),
                          child: Row(
                            children: [
                              Icon(
                                MaterialCommunityIcons.facebook,
                                size: 35,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          )),
                      TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.all(15),
                              side: BorderSide(width: 1, color: Colors.white38),
                              minimumSize: Size(50, 2),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80)),
                              primary: Colors.white,
                              backgroundColor: Colors.redAccent),
                          child: Row(
                            children: [
                              Icon(
                                MaterialCommunityIcons.google_plus,
                                size: 35,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          )),
                      TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.all(15),
                              side: BorderSide(width: 1, color: Colors.white38),
                              minimumSize: Size(50, 2),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80)),
                              primary: Colors.white,
                              backgroundColor: Colors.lightBlue),
                          child: Row(
                            children: [
                              Icon(
                                MaterialCommunityIcons.twitter,
                                size: 35,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ))
                    ],
                  )
                ],
              ))
        ],
      ),
    );
    //
    // TextField buildTextField(
    // IconData icon, String hintText,bool isPassword,bool isRePassword
    // ){
    //   return TextField(
    //     decoration: InputDecoration(prefixIcon: Icon(
    //       icon,
    //       color: Colors.black54,
    //     ),
    //       enabledBorder: OutlineInputBorder(
    //         borderSide: BorderSide(color: Colors.blueGrey),
    //         borderRadius: BorderRadius.all(Radius.circular(35)),
    //
    //       ),
    //       focusedBorder: OutlineInputBorder(
    //         borderSide: BorderSide(color: Colors.blueGrey),
    //         borderRadius: BorderRadius.all(Radius.circular(35))
    //       ),
    //       contentPadding: EdgeInsets.all(10),
    //       hintText: hintText,
    //         hintStyle: TextStyle(fontSize: 14,color:Colors.black54,letterSpacing: 1)
    //     ),
    //
    //   ),
    //
    // }
  }

  Container buildSigningSection() {
    return Container(
      margin: EdgeInsets.only(top: 35),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(
                  MaterialCommunityIcons.email_check_outline,
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                    borderRadius: BorderRadius.all(Radius.circular(35))),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                  borderRadius: BorderRadius.all(
                    Radius.circular(35),
                  ),
                ),
                hintText: "Email or Username",
                hintStyle: TextStyle(
                    fontSize: 14, color: Colors.black54, letterSpacing: 1)),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(
                  MaterialCommunityIcons.email_check_outline,
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                    borderRadius: BorderRadius.all(Radius.circular(35))),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                  borderRadius: BorderRadius.all(
                    Radius.circular(35),
                  ),
                ),
                hintText: "Password",
                hintStyle: TextStyle(
                    fontSize: 14, color: Colors.black54, letterSpacing: 1)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(180, 10, 10, 10),
            child: TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password ? ",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.2),
                )),
          )
        ],
      ),
    );
  }

  Container buildSignUpSection() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          //buildTextField(MaterialCommunityIcons.account_outline,"UserName",false,false),
          TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(
                  MaterialCommunityIcons.email_check_outline,
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                    borderRadius: BorderRadius.all(Radius.circular(35))),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                  borderRadius: BorderRadius.all(
                    Radius.circular(35),
                  ),
                ),
                hintText: "Email or Username",
                hintStyle: TextStyle(
                    fontSize: 14, color: Colors.black54, letterSpacing: 1)),
          ),

          SizedBox(
            height: 13,
          ),

          TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(
                  MaterialCommunityIcons.textbox_password,
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                    borderRadius: BorderRadius.all(Radius.circular(35))),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                  borderRadius: BorderRadius.all(
                    Radius.circular(35),
                  ),
                ),
                hintText: "Password",
                hintStyle: TextStyle(
                    fontSize: 14, color: Colors.black54, letterSpacing: 1)),
          ),
          SizedBox(
            height: 13,
          ),

          TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(
                  MaterialCommunityIcons.textbox_password,
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                    borderRadius: BorderRadius.all(Radius.circular(35))),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                  borderRadius: BorderRadius.all(
                    Radius.circular(35),
                  ),
                ),
                hintText: "Confirm Password",
                hintStyle: TextStyle(
                    fontSize: 14, color: Colors.black54, letterSpacing: 1)),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            width: 200,
            margin: EdgeInsets.only(top: 20),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "By processing 'Submit', you agree to our ",
                    style: TextStyle(letterSpacing: 0.5, color: Colors.grey),
                    children: [
                      TextSpan(
                          text: " terms & conditions ",
                          style: TextStyle(color: Colors.orange))
                    ])),
          )
        ],
      ),
    );
  }
}
