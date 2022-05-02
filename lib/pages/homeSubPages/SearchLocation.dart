import 'package:flutter/material.dart';
import 'package:flutter_dapp/pages/homePage.dart';
import 'package:flutter_dapp/pages/homeSubPages/ShowDetails.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_dapp/models/recommended_model.dart';

class SearchLocation extends StatefulWidget {
  const SearchLocation({Key? key}) : super(key: key);

  @override
  _SearchLocationState createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  final locationName = TextEditingController();
  final locationDescription = TextEditingController();
  var locInfo;

  getItemAndNavigate(BuildContext context) {
    //Navigate to ShowDetails page when button clicked
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ShowDetails(nameHolder: locationName.text)));
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
          child: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 12, left: 28.8),
          child: Text('Search Location',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
        ),
        Container(
            width: 280,
            padding: EdgeInsets.all(30.0),
            child: TextField(
              controller: locationName,
              autocorrect: true,
              decoration: InputDecoration(hintText: 'Enter Location Name Here'),
            )),
        Container(
          child: ElevatedButton(
            onPressed: () => getItemAndNavigate(context),
            child: Text(
              "Search",
              style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
            style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                primary: Theme.of(context).backgroundColor),
          ),
        ),
      ])),
    );
  }
}
