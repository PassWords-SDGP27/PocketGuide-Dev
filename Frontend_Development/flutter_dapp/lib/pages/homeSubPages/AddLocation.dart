import 'package:flutter/material.dart';
import 'package:flutter_dapp/models/location_result.dart';
import 'package:flutter_dapp/pages/homeSubPages/locationSelectorPage.dart';
import 'package:flutter_dapp/pages/homeSubPages/AddLocationSummary.dart';

class AddLocation extends StatefulWidget {
  const AddLocation({Key? key}) : super(key: key);
  @override
  _AddLocationState createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  LocationResult? locationResult;
  final locationName = TextEditingController();
  final locationDescription = TextEditingController();

  getItemAndNavigate(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddLocationSummary(
                nameHolder: locationName.text,
                descriptionHolder: locationDescription.text,
                locCoordinatesHolder: "${locationResult!.latLng!.latitude}\n${locationResult!.latLng!.longitude}")));
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
            child: Text('Show Summary'),
          ),
        ],
      ),
    ),
    );
  }
}
