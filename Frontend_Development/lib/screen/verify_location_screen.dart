// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final locationName = TextEditingController();
  final locationCoordinates = TextEditingController();
  

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
                padding: EdgeInsets.only(top: 250, left: 28.8),
                child: Text(
                  'Verify Location',
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

              Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Center(child:
          Text('Location Name: ' + locationName.text ,
            style: TextStyle(fontSize: 22), 
            textAlign: TextAlign.center,)),
 
        Center(child:
          Text('Location Coordinates ' + locationCoordinates.text ,
            style: TextStyle(fontSize: 22), 
            textAlign: TextAlign.center,)),
          ]),
         
          RaisedButton(
            //onPressed: () => getItemAndNavigate(context),
            color: Color(0xffFF1744),
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text('Verify'),
          ),
        ],
      ),
    ));
  }
}
