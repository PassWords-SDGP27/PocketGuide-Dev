import 'package:flutter/material.dart';
import 'package:flutter_dapp/models/location_result.dart';
import 'package:map_address_picker/map_address_picker.dart';

class LocationSelectorPage extends StatefulWidget {
  const LocationSelectorPage({Key? key}) : super(key: key);

  @override
  _LocationSelectorPageState createState() => _LocationSelectorPageState();
}

class _LocationSelectorPageState extends State<LocationSelectorPage> {
  LocationResult? locationResult;
  final locationName = TextEditingController();
  final locationDescription = TextEditingController();
  _openLocationPicker() async {
    var _result = await showLocationPicker(
      context,
      mapType: MapType.terrain,
      requiredGPS: true,
      automaticallyAnimateToCurrentLocation: true,
      // initialCenter: LatLng(28.612925, 77.229512),
      desiredAccuracy: LocationAccuracy.best,
      //title: "Pick your location",
      // layersButtonEnabled: true,
      // initialZoom: 16,
      //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
    if (mounted)
      setState(() => locationResult = LocationResult(latLng: _result?.latLng));
  }

  @override
  Widget build(BuildContext context) {
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
      child: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top:12,left: 28.8),
              child: Text('Add Location',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
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
                color: Colors.transparent,
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      controller: locationDescription,
                      autocorrect: true,
                      maxLines: 8,
                      decoration: InputDecoration(
                          hintText: 'Enter Location Description Here'),
                    ))),
            ElevatedButton(
              onPressed: _openLocationPicker,
              child: Text("Add Location"),
            ),
              Center(
                  child: Text(
                'Location Name: ' + locationName.text,
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              )),

              Center(
                  child: Text(
                'Location Description: ' + locationDescription.text,
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              )),

              Center(
                child: Text(
                  locationResult == null
                  ? ""
                  :"Co-Ordinates:"+ (locationResult!.latLng!.latitude).toString() + ", " + (locationResult!.latLng!.longitude).toString(),
                  style: TextStyle(fontSize: 22)
                )
              ),
          ],
        ),
      ),
    );
  }
}
