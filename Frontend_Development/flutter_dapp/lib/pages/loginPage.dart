
import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_dapp/contractLikings/contractLinking.dart';
import 'package:flutter_dapp/models/httpException.dart';
import 'package:flutter_dapp/pages/homePage.dart';
import 'package:flutter_dapp/pages/signUpPage.dart';
import 'package:flutter_dapp/providers/auth.dart';
import 'package:flutter_dapp/widgets/errorAlertDialogWidget.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/loginScreen';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  bool _isLoading = false;

  //getting device info
  @override
  void initState() {
    super.initState();

  }

  final _loginFormKey = GlobalKey<FormState>();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  Map<String, String> _logInData = {
    'email': '',
    'password': '',
  };

  bool _correctEmail = false;
  bool _showPassword = true;

  //Method for creating aleart on erros
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
              onPressed: () => Navigator.of(ctx).pop(), child: Text('Okay'))
        ],
      ),
    );
  }

 
  @override
  Widget build(BuildContext context) {
    //var contractLink = Provider.of<ContractLinking>(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color(0xFF03406D),
              Color(0xFF0C5A83),
              Color(0xFF196F92),
              Color(0xFF2685A2),
              Color(0xFF3A9BB2),
              Color(0xFF69B3BB),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 45),
                    child: Text(
                      'Hello!\nPocket Guide:\nYour Adventure Awaits!',
                      style: GoogleFonts.playfairDisplay(
                        fontSize:40, fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      height: 400,
                      margin: EdgeInsets.only(top: 30),
                      child: Center(
                        child: Form(
                          autovalidateMode: AutovalidateMode.always,
                          key: _loginFormKey,
                          child: ListView(
                            semanticChildCount: 20,
                            children: <Widget>[
                              SizedBox(height: 15),
                              //Email field
                              TextFormField(
                                autofocus: false,
                                focusNode: _emailFocusNode,
                                onFieldSubmitted: (_) {
                                  fieldFocusChange(context, _emailFocusNode,
                                      _passwordFocusNode);
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
                                  if (EmailValidator.validate(
                                      emailValidator!) ==
                                      false) {
                                    return "Please enter a valid email.";
                                  } else
                                    return null;
                                },
                                onSaved: (_emailValue) {
                                  _logInData['email'] = _emailValue!;
                                },
                                key: ValueKey("email"),
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                  labelText: "E mail",
                                  labelStyle: GoogleFonts.lato(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  suffixIcon: _correctEmail
                                      ? Icon(
                                    Icons.done,
                                    color:
                                    Color.fromARGB(255, 0, 0, 0),
                                  )
                                      : Icon(
                                    Icons.close_outlined,
                                    color:
                                    Color.fromARGB(255, 0, 0, 0),
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
                              SizedBox(height: 15),
                              TextFormField(
                                autofocus: false,
                                obscureText: _showPassword,
                                focusNode: _passwordFocusNode,
                                onSaved: (_passValue) {
                                  _logInData['password'] = _passValue!;
                                },
                                key: ValueKey('password'),
                                keyboardType: TextInputType.visiblePassword,
                                style: TextStyle(fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle: GoogleFonts.lato(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  //show password functionality
                                  suffix: IconButton(
                                    icon: _showPassword
                                        ? Icon(
                                      Icons.visibility_off,
                                      color:
                                      Color.fromARGB(255, 0, 0, 0),
                                    )
                                        : Icon(
                                      Icons.visibility,
                                      color:
                                      Color.fromARGB(255, 0, 0, 0),
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
                              ),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    child: TextButton(
                                      onPressed: () {
                                       // resetPassword();
                                      },
                                      child: Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Container(
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_loginFormKey.currentState!
                                        .validate()) {
                                      _loginFormKey.currentState!.save();
                                      setState(() {
                                        _isLoading = true;
                                      });

                                      try {
                                        await Provider.of<Auth>(context,
                                            listen: false)
                                            .login(
                                          email: _logInData['email']!,
                                          password: _logInData['password']!,

                                        )
                                            .then((_) {
                                          setState(() {
                                            _isLoading = false;
                                            _loginFormKey.currentState!
                                                .reset();
                                          });

                                          Navigator.push(context, new MaterialPageRoute(
                                            builder: (context) => new HomePage()
                                              ));
                                        });
                                      } on TimeoutException catch (_) {
                                        const errorMessage =
                                            'Could not make connection. Please try again later.';
                                        setState(() {
                                          _isLoading = false;
                                        });
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return ErrorAlertDialogWidget(
                                                title: "Login Failed!",
                                                message: errorMessage,
                                              );
                                            });
                                      } on HttpException catch (error) {
                                        setState(() {
                                          _isLoading = false;
                                        });
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return ErrorAlertDialogWidget(
                                                title: "Login Failed!",
                                                message: error.message,
                                              );
                                            });
                                      }
                                    }
                                  },
                                  child: Text(
                                    "LOGIN",
                                    style: GoogleFonts.lato(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900,
                                           color: Color.fromARGB(255, 0, 0, 0)
                                        ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      shape: new RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(8),
                              
                                      ),
                                      primary: Theme.of(context).backgroundColor),
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
                                         Navigator.push(context, new MaterialPageRoute(
                                           builder: (context) => new SignUpScreen()
                                         ));
                                       // contractLink.getUser(email,password);
                                      },
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(
                                            color:
                                            Color.fromARGB(255, 0, 0, 0)),
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
        ),
      ),
    );
  }
}