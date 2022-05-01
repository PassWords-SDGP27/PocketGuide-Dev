import "package:flutter/material.dart";
import 'package:flutter_dapp/pages/homeSubPages/SearchLocation.dart';
import 'package:flutter_dapp/pages/homeSubPages/feedbackPage.dart';
import 'package:flutter_dapp/pages/homeSubPages/locationSelectorPage.dart';
import 'package:flutter_dapp/pages/homeSubPages/LandingPage.dart';

import '../widgets/ArCoreController.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/homeScreen';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  //List to store the pages for the Navigation Bar
  final List _children = [LandingPage(), SearchLocation(),ARCoreController(), LocationSelectorPage(), FeedbackPage() ];
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex  = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    resizeToAvoidBottomInset: false,
    //App Bar title
      appBar: AppBar(title: Text("Pocket Guide"),),
     body: _children[_currentIndex],
     
     bottomNavigationBar: BottomNavigationBar(
       type: BottomNavigationBarType.fixed,
       backgroundColor:  Color(0xFF69B3BB),
      currentIndex: _currentIndex,
       onTap: _onItemTapped,// this will be set when a new tab is tapped
       //Items for the bottom navigation bar with labels and icons
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.search),
          label: 'Search',
        ),
         BottomNavigationBarItem(
          icon: new Icon(Icons.view_in_ar),
          label: 'Virtual Guide',
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.add_location),
          label: 'Add Location',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.reviews),
            label: 'Feedback '
        )
      ],

    ),

    );
  }
}
