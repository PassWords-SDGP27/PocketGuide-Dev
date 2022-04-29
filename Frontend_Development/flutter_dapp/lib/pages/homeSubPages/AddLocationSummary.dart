import 'package:flutter/material.dart';

class AddLocationSummary extends StatelessWidget {
  final nameHolder;
  final descriptionHolder;
  final locCoordinatesHolder;

  AddLocationSummary({@required this.nameHolder, this.descriptionHolder, this.locCoordinatesHolder});

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
              Center(
                  child: Text(
                'Location Name: ' + nameHolder,
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              )),
              Center(
                  child: Text(
                'Location Description: ' + descriptionHolder,
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              )),
              RaisedButton(
                onPressed: () => goBack(context),
                color: Colors.lightBlue,
                textColor: Colors.white,
                child: Text('Go Back To Previous Screen'),
              )
            ]));
  }
}
