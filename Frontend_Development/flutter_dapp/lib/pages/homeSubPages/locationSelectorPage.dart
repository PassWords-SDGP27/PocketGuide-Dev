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
  _openLocationPicker() async {
    var _result = await showLocationPicker(
      context,
      mapType: MapType.terrain,
      requiredGPS: true,
      automaticallyAnimateToCurrentLocation: true,
      // initialCenter: LatLng(28.612925, 77.229512),
      // desiredAccuracy: LocationAccuracy.best,
      // title: "Pick your location",
      // layersButtonEnabled: true,
      // initialZoom: 16,
      //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );

    if (mounted) setState(() => locationResult = LocationResult(latLng: _result?.latLng));
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _openLocationPicker,
              child: Text("Add Location"),
            ),
            Text(
              locationResult == null
                  ? ""
                  : "${locationResult!.latLng!.latitude}\n${locationResult!.latLng!.longitude}",
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}

