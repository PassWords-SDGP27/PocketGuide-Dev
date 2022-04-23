import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dapp/models/httpException.dart';
import 'package:flutter_dapp/pages/loginPage.dart';
import 'package:flutter_dapp/widgets/backgroundWidgetWithoutBottomNav.dart';
import 'package:flutter_dapp/widgets/errorAlertDialogWidget.dart';
import 'package:flutter_dapp/widgets/pageTopTitile.dart';
import 'package:intl/intl.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/registerScreen';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _loader = false;
  var deviceData;

  //getting device info
  @override
  void initState() {
    super.initState();


    print(deviceData);
  }

  // device info method

  final _registerFormKey = GlobalKey<FormState>();
  FocusNode _fullNameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _confirmPasswordFocusNode = FocusNode();
  FocusNode _contactNumFocusNode = FocusNode();
  FocusNode _educationFocusNode = FocusNode();
  FocusNode _universityFocusNode = FocusNode();

  // field focus change function
  void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  // Validate password regular expression function
  bool validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  Map<String, String> _registerData = {
    'fullName': '',
    'email': '',
    'password': '',
    'contactNo': '',
    'education': "Pre Medicine",
    'university': '',
  };

  var _eductionList = [
    "Pre Medicine",
    "Medical Undergraduate",
    "Medical Postgraduate",
  ];

  bool _correctEmail = false;
  bool _correctFulName = false;
  bool _correctContactNumber = false;
  bool _correctUniversity = false;
  bool _showPassword = true;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return BackgroundWidgetWithoutBottomNav(
      img: "assets/images/normal_bubble.png",
      backgroundColor: Color.fromRGBO(148, 202, 204, 1),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              PageTopTitle(
                title: "Hello",
                description: "Let's progress together with Intelekt.",
                titleColor: Color.fromRGBO(54, 69, 90, 1),
                descriptionColor: Color.fromRGBO(73, 85, 102, 1),
              ),
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.70,
                  margin: EdgeInsets.only(top: 5),
                  child: Center(
                    child: Form(
                      // autovalidateMode: AutovalidateMode.always,
                      key: _registerFormKey,
                      child: ListView(
                        semanticChildCount: 20,
                        children: <Widget>[
                          SizedBox(height: 5),
                          //                                                    Full name field
                          TextFormField(
                            autofocus: false,
                            focusNode: _fullNameFocusNode,
                            onFieldSubmitted: (_) {
                              fieldFocusChange(
                                  context, _fullNameFocusNode, _emailFocusNode);
                            },
                            onChanged: (_fullNameValidate) {
                              if (_fullNameValidate.isNotEmpty == true &&
                                  _fullNameValidate.length >= 1) {
                                setState(() {
                                  _correctFulName = true;
                                });
                                print(_correctFulName);
                              } else {
                                setState(() {
                                  _correctFulName = false;
                                });
                                print(_correctFulName);
                              }
                            },
                            validator: (_fullNameValidater) {
                              if (_fullNameValidater!.isEmpty == true ||
                                  _fullNameValidater.length < 5) {
                                return "Please enter your full name.";
                              } else
                                return null;
                            },
                            onSaved: (_emailValue) {
                              _registerData['fullName'] = _emailValue!;
                            },
                            key: ValueKey("fullName"),
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                              labelText: "Full Name",
                              labelStyle: TextStyle(
                                color: Color.fromRGBO(72, 72, 72, 1),
                                fontSize: 14,
                              ),
                              suffixIcon: _correctFulName
                                  ? Icon(
                                Icons.done,
                                color: Color.fromRGBO(72, 72, 72, 1),
                              )
                                  : Icon(
                                Icons.close_outlined,
                                color: Color.fromRGBO(72, 72, 72, 1),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),

                          //                                                    email field
                          TextFormField(
                            autofocus: false,
                            focusNode: _emailFocusNode,
                            onFieldSubmitted: (_) {
                              fieldFocusChange(
                                  context, _emailFocusNode, _passwordFocusNode);
                            },
                            onChanged: (_emailValue) {
                              if (EmailValidator.validate(_emailValue) ==
                                  true) {
                                setState(() {
                                  _correctEmail = true;
                                });
                                print(_correctEmail);
                              } else {
                                setState(() {
                                  _correctEmail = false;
                                });
                                print(_correctEmail);
                              }
                            },
                            validator: (emailValidator) {
                              if (EmailValidator.validate(emailValidator!) ==
                                  false) {
                                return "Please enter a valid email.";
                              } else
                                return null;
                            },
                            onSaved: (_emailValue) {
                              _registerData['email'] = _emailValue!;
                            },
                            key: ValueKey("email"),
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                              labelText: "E mail",
                              labelStyle: TextStyle(
                                color: Color.fromRGBO(72, 72, 72, 1),
                                fontSize: 14,
                              ),
                              suffixIcon: _correctEmail
                                  ? Icon(
                                Icons.done,
                                color: Color.fromRGBO(72, 72, 72, 1),
                              )
                                  : Icon(
                                Icons.close_outlined,
                                color: Color.fromRGBO(72, 72, 72, 1),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),

                          //                                                     password field
                          TextFormField(
                            autofocus: false,
                            obscureText: _showPassword,
                            focusNode: _passwordFocusNode,
                            onFieldSubmitted: (_) {
                              fieldFocusChange(context, _passwordFocusNode,
                                  _confirmPasswordFocusNode);
                            },
                            key: ValueKey('password'),
                            keyboardType: TextInputType.visiblePassword,
                            style: TextStyle(fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                              // hintText: "Pass@123",
                              labelText: "Password",
                              labelStyle: TextStyle(
                                color: Color.fromRGBO(72, 72, 72, 1),
                                fontSize: 14,
                              ),
                              //show password functionality
                              suffixIcon: IconButton(
                                padding: EdgeInsets.symmetric(vertical: 0),
                                icon: _showPassword
                                    ? Icon(
                                  Icons.visibility_off,
                                  size: 18,
                                  color: Color.fromRGBO(72, 72, 72, 1),
                                )
                                    : Icon(
                                  Icons.visibility,
                                  size: 18,
                                  color: Color.fromRGBO(72, 72, 72, 1),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                },
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                            onChanged: (_passwordEnterd) {
                              setState(() {
                                _password = _passwordEnterd;
                              });
                            },
                            validator: (_validatePassword) {
                              if (_validatePassword!.isEmpty ||
                                  !validatePassword(_validatePassword)) {
                                return "Invalid Password ! \nPassword must have at least One capital letter, one number \nand one non numeric character with 8 characters.";
                              } else {
                                return null;
                              }
                            },
                          ),
                          //SizedBox(height: 5),
                          //                                                    Confirm password field
                          TextFormField(
                            autofocus: false,
                            obscureText: true,
                            focusNode: _confirmPasswordFocusNode,
                            onSaved: (_passValue) {
                              _registerData['password'] = _passValue!;
                            },
                            onFieldSubmitted: (_) {
                              fieldFocusChange(
                                  context,
                                  _confirmPasswordFocusNode,
                                  _contactNumFocusNode);
                            },
                            key: ValueKey('confirmPassword'),
                            keyboardType: TextInputType.visiblePassword,
                            style: TextStyle(fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                              labelText: "Confirm Password",
                              labelStyle: TextStyle(
                                color: Color.fromRGBO(72, 72, 72, 1),
                                fontSize: 14,
                              ),
                              //show password functionality
                              // suffixIcon: Icon(
                              //   Icons.visibility_off,
                              //   size: 18,
                              //   color: Color.fromRGBO(72, 72, 72, 1),
                              // ),

                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                            validator: (_validateConfirmPassword) {
                              if (_validateConfirmPassword!.isEmpty ||
                                  _validateConfirmPassword != _password) {
                                return "Re Enter correct password";
                              } else {
                                return null;
                              }
                            },
                          ),

                          //                                                    Contact number Form Field
                          TextFormField(
                            autofocus: false,
                            focusNode: _contactNumFocusNode,
                            onFieldSubmitted: (_) {
                              fieldFocusChange(context, _contactNumFocusNode,
                                  _educationFocusNode);
                            },
                            onChanged: (_contactNumber) {
                              if (_contactNumber.isNotEmpty == true &&
                                  _contactNumber.length >= 10) {
                                setState(() {
                                  _correctContactNumber = true;
                                });
                              } else {
                                setState(() {
                                  _correctContactNumber = false;
                                });
                              }
                            },
                            validator: (_contactNumValidator) {
                              if (_contactNumValidator!.isEmpty == true &&
                                  _contactNumValidator.length < 10) {
                                return "Please enter correct contact number.";
                              } else
                                return null;
                            },
                            onSaved: (_emailValue) {
                              _registerData['contactNo'] = _emailValue!;
                            },
                            key: ValueKey("contactNo"),
                            keyboardType: TextInputType.phone,
                            style: TextStyle(fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                              labelText: "Contact Number",
                              labelStyle: TextStyle(
                                color: Color.fromRGBO(72, 72, 72, 1),
                                fontSize: 14,
                              ),
                              suffixIcon: _correctContactNumber
                                  ? Icon(
                                Icons.done,
                                color: Color.fromRGBO(72, 72, 72, 1),
                              )
                                  : Icon(
                                Icons.close_outlined,
                                color: Color.fromRGBO(72, 72, 72, 1),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),

                          //                                                    University form field
                          TextFormField(
                            autofocus: false,
                            focusNode: _universityFocusNode,
                            onChanged: (_universityValidate) {
                              if (_universityValidate.isNotEmpty == true &&
                                  _universityValidate.length >= 1) {
                                setState(() {
                                  _correctUniversity = true;
                                });
                              } else {
                                setState(() {
                                  _correctUniversity = false;
                                });
                              }
                            },
                            validator: (_universityValidator) {
                              if (_universityValidator!.isEmpty) {
                                return "Please enter valid university.";
                              } else
                                return null;
                            },
                            onSaved: (_uniValue) {
                              _registerData['university'] = _uniValue!;
                            },
                            key: ValueKey("university"),
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12),
                            decoration: InputDecoration(
                              // hintText: "University of Colombo",
                              // hintStyle: TextStyle(color: Colors.grey),
                              labelText: "University",
                              labelStyle: TextStyle(
                                color: Color.fromRGBO(72, 72, 72, 1),
                                fontSize: 14,
                              ),
                              suffixIcon: _correctUniversity
                                  ? Icon(
                                Icons.done,
                                color: Color.fromRGBO(72, 72, 72, 1),
                              )
                                  : Icon(
                                Icons.close_outlined,
                                color: Color.fromRGBO(72, 72, 72, 1),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),

                          //                                                   Education form field
                          FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(),
                                    errorStyle: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 14.0),
                                    hintText: 'Please select Eduction',
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                    )),
                                isEmpty: _registerData['education'] == '',
                                child: DropdownButtonHideUnderline(
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: DropdownButton<String>(
                                      iconSize: 25,
                                      value: _registerData['education'],
                                      isDense: true,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _registerData['education'] =
                                          newValue!;
                                          state.didChange(newValue);
                                        });
                                      },
                                      items: _eductionList.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    72, 72, 72, 1),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),

                          SizedBox(height: 40),

                          Container(
                            height: 55,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_registerFormKey.currentState!.validate()) {
                                  _registerFormKey.currentState!.save();

                                  setState(() {
                                    _loader = true;
                                  });




                                }
                                setState(() {
                                  _loader = false;
                                });
                              },
                              child: _loader
                                  ? CircularProgressIndicator(
                                backgroundColor:
                                Color.fromRGBO(0, 51, 52, 1),
                              )
                                  : Text(
                                "SIGN UP",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  primary: Theme.of(context).buttonColor),
                            ),
                          ),
                          Container(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Don't Have An Account?"),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 51, 52, 1)),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}