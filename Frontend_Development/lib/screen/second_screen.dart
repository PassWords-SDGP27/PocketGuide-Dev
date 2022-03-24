// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final nameHolder;
  final descriptionHolder;

  SecondScreen({Key key, @required this.nameHolder, this.descriptionHolder})
      : super(key: key);

  goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Location"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Center(child:
          Text('Location Name: ' + nameHolder,
            style: TextStyle(fontSize: 22), 
            textAlign: TextAlign.center,)),
 
        Center(child:
          Text('Location Description: ' + descriptionHolder,
            style: TextStyle(fontSize: 22), 
            textAlign: TextAlign.center,)),
 
          RaisedButton(
            onPressed: ()=> goBack(context),
            color: Colors.lightBlue,
            textColor: Colors.white,
            child: Text('Go Back To Previous Screen'),
          )])
    );
  }
}
