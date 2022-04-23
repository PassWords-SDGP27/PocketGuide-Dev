
import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dapp/contractLikings/contractLinking.dart';
import 'package:flutter_dapp/models/httpException.dart';
import 'package:flutter_dapp/pages/homePage.dart';

import 'package:flutter_dapp/pages/signUpPage.dart';
import 'package:flutter_dapp/providers/auth.dart';
import 'package:flutter_dapp/widgets/errorAlertDialogWidget.dart';
import 'package:flutter_dapp/widgets/pageTopTitile.dart';
import 'package:provider/provider.dart';

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

  final _resetPWFormKey = GlobalKey<FormState>();
  String _resetEmail = "";

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

  // void resetPassword() {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
  //           buttonPadding: EdgeInsets.all(0),
  //           content: Container(
  //             margin: EdgeInsets.symmetric(vertical: 5),
  //             //height: 500,
  //             child: Container(
  //               height: 200,
  //               child: Form(
  //                 key: _resetPWFormKey,
  //                 child: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: <Widget>[
  //                     Padding(
  //                       padding: const EdgeInsets.symmetric(
  //                           horizontal: 15, vertical: 20),
  //                       child: Text(
  //                         "Email your registered email below to receive password reset instruction",
  //                         textAlign: TextAlign.center,
  //                         style: TextStyle(
  //                             fontSize: 12,
  //                             color: Color.fromRGBO(0, 51, 52, 1)),
  //                       ),
  //                     ),
  //                     Padding(
  //                       padding: const EdgeInsets.symmetric(
  //                           horizontal: 15, vertical: 20),
  //                       child: TextFormField(
  //                         autofocus: true,
  //                         onChanged: (_emailValue) {
  //                           if (EmailValidator.validate(_emailValue) == true) {
  //                             setState(() {
  //                               _correctEmail = true;
  //                             });
  //                             print(_correctEmail);
  //                           } else {
  //                             setState(() {
  //                               _correctEmail = false;
  //                             });
  //                             print(_correctEmail);
  //                           }
  //                         },
  //                         validator: (emailValidator) {
  //                           if (EmailValidator.validate(emailValidator!) ==
  //                               false) {
  //                             return "Please enter a valid email.";
  //                           } else
  //                             return null;
  //                         },
  //                         onSaved: (_emailValue) {
  //                           _resetEmail = _emailValue!;
  //                         },
  //                         key: ValueKey("resetEmail"),
  //                         keyboardType: TextInputType.emailAddress,
  //                         style: TextStyle(fontWeight: FontWeight.w500),
  //                         decoration: InputDecoration(
  //                           labelText: "Enter your Email",
  //                           labelStyle: TextStyle(
  //                             color: Color.fromRGBO(72, 72, 72, 1),
  //                             fontSize: 14,
  //                           ),
  //                           border: UnderlineInputBorder(
  //                             borderSide: BorderSide(
  //                               color: Color.fromRGBO(126, 180, 181, 1),
  //                               width: 2,
  //                             ),
  //                           ),
  //                           focusedBorder: UnderlineInputBorder(
  //                             borderSide: BorderSide(
  //                               color: Color.fromRGBO(126, 180, 181, 1),
  //                               width: 2,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //           actions: [
  //             Container(
  //               width: MediaQuery.of(context).size.width,
  //               height: 60,
  //               child: ElevatedButton(
  //                 style: ButtonStyle(
  //                   backgroundColor: MaterialStateProperty.all(
  //                     Color.fromRGBO(1, 161, 164, 1),
  //                   ),
  //                 ),
  //                 onPressed: () async {
  //                   if (_resetPWFormKey.currentState!.validate()) {
  //                     _resetPWFormKey.currentState!.save();
  //
  //                     UserApis user = new UserApis();
  //                     try {
  //                       await user
  //                           .resetPassword(_resetEmail)
  //                           .then(ScaffoldMessenger.of(context).showSnackBar(
  //                         SnackBar(
  //                           content: const Text(
  //                             "Password Reset Success!!. Please Check Your Email (Inbox or Spam)",
  //                             textAlign: TextAlign.center,
  //                           ),
  //                         ),
  //                       ));
  //                     } on TimeoutException catch (_) {
  //                       showDialog(
  //                           context: context,
  //                           builder: (BuildContext context) {
  //                             return ErrorAlertDialogWidget(
  //                               title: "Time out!",
  //                               message:
  //                               'Could not make connection. Please try again later.',
  //                             );
  //                           });
  //                     } on HttpException catch (error) {
  //                       showDialog(
  //                           context: context,
  //                           builder: (BuildContext context) {
  //                             return ErrorAlertDialogWidget(
  //                               title: "Registration Failed!",
  //                               message: error.toString(),
  //                             );
  //                           });
  //                     }
  //                   }
  //                 },
  //                 child: Text("SEND"),
  //               ),
  //             )
  //           ],
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    var contractLink = Provider.of<ContractLinking>(context);

    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(148, 202, 204, 1),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   leading: IconButton(
        //     icon: Icon(Icons.arrow_back_ios_outlined),
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //   ),
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        // ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 55),
                    child: PageTopTitle(
                      title: "Hello",
                      description: "Let's progress together with Intelekt.",
                      titleColor: Color.fromRGBO(54, 69, 90, 1),
                      descriptionColor: Color.fromRGBO(73, 85, 102, 1),
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
                                  labelStyle: TextStyle(
                                    color: Color.fromRGBO(72, 72, 72, 1),
                                    fontSize: 14,
                                  ),
                                  suffixIcon: _correctEmail
                                      ? Icon(
                                    Icons.done,
                                    color:
                                    Color.fromRGBO(72, 72, 72, 1),
                                  )
                                      : Icon(
                                    Icons.close_outlined,
                                    color:
                                    Color.fromRGBO(72, 72, 72, 1),
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
                                  labelStyle: TextStyle(
                                    color: Color.fromRGBO(72, 72, 72, 1),
                                    fontSize: 14,
                                  ),
                                  //show password functionality
                                  suffix: IconButton(
                                    icon: _showPassword
                                        ? Icon(
                                      Icons.visibility_off,
                                      color:
                                      Color.fromRGBO(72, 72, 72, 1),
                                    )
                                        : Icon(
                                      Icons.visibility,
                                      color:
                                      Color.fromRGBO(72, 72, 72, 1),
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
                                            color: Color.fromRGBO(
                                                72, 72, 72, 1)),
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

                                          Navigator.pushReplacementNamed(
                                              context, HomePage.routeName);
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
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      shape: new RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(8),
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
                                        // Navigator.pushNamed(
                                        //     context, SignUpScreen.routeName);
                                       // contractLink.addLocation("Colombo", "Thisis Colombo", "478596");
                                      },
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(
                                            color:
                                            Color.fromRGBO(0, 51, 52, 1)),
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