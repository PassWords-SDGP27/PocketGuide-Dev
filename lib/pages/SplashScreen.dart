import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dapp/pages/loginPage.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splashScreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 4);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));//Material Page Route
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset('assets/images/logo.png', height: 190.0, width: 400.0),
             Padding(
              padding: EdgeInsets.only(top:20),
              child: Text('POCKET GUIDE',
                style: GoogleFonts.playfairDisplay(fontSize: 45.6, fontWeight: FontWeight.w700),
                ),
            ),
            CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
            ),
           
          ],
        ),
      ),
    );
  }
}
