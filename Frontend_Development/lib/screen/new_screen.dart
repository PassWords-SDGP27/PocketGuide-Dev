// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import "second_screen.dart";

class HomeScreen extends StatefulWidget {
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final locationName = TextEditingController();
  final locationDescription = TextEditingController();

  getItemAndNavigate(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SecondScreen(
                nameHolder: locationName.text,
                descriptionHolder: locationDescription.text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration:BoxDecoration(
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
        children: <Widget>[
          Padding(
                padding: EdgeInsets.only(top: 32, left: 28.8),
                child: Text(
                  'Add Location',
                  style:TextStyle(
                    fontSize: 24, fontWeight: FontWeight.w700)
                ),
              ),
          Container(
              width: 280,
              padding: EdgeInsets.all(30.0),
              child: TextField(
                controller: locationName,
                autocorrect: true,
                decoration:
                    InputDecoration(hintText: 'Enter Location Name Here'),
              )),
          Card(
              color: Colors.grey,
              
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                    controller: locationDescription,
                    autocorrect: true,
                    maxLines: 8,
                    decoration: InputDecoration(
                    hintText: 'Enter Location Description Here'),
                )
              )
               ),
          RaisedButton(
            onPressed: () => getItemAndNavigate(context),
            color: Color(0xffFF1744),
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text('Click Here To Send All Entered Items To Next Screen'),
          ),
        ],
      ),
    ));
  }
}
