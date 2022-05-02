import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_dapp/models/recommended_model.dart';

class ShowDetails extends StatelessWidget {
  final nameHolder;

  const ShowDetails({Key? key, @required this.nameHolder}) : super(key: key);

  goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var locInfo = " ";

    if (nameHolder == 'Sigiriya') {
      locInfo = recommendations[0].description;
    }
    else if (nameHolder == 'Ella') {
      locInfo = recommendations[1].description;
    }
    else if (nameHolder == 'Nuwara Eliya') {
      locInfo = recommendations[2].description;
    } else {
      locInfo = "Location Not Found";
    }

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
            padding: EdgeInsets.only(top: 80, left: 5.8),
            child: Text('Location Details',
                style: GoogleFonts.playfairDisplay(fontSize: 24, fontWeight: FontWeight.w700,decoration: TextDecoration.none, color:Colors.black)),
          ),
          Container(
            padding: EdgeInsets.all(30.0),
              child: Text(
            'Location Name: ' + nameHolder,
            style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.w500, decoration: TextDecoration.none, color:Colors.black),
            textAlign: TextAlign.center,
          )),
          Container(
            padding: EdgeInsets.all(10.0),
              child: Text(
             locInfo,
            style: TextStyle(fontSize: 22,color:Colors.black, decoration: TextDecoration.none),
            textAlign: TextAlign.justify,
            )),
          ElevatedButton(
            onPressed: () => goBack(context),
            child: Text(
              'Search New Location',
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
          )
        ]),
      ),
    );
  }
}
