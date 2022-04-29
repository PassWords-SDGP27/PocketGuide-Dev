import "package:flutter/material.dart";
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
  final List _children = [LandingPage(), ARCoreController(), LocationSelectorPage(), FeedbackPage() ];
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex  = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Pocket Guide"),),
     body: _children[_currentIndex],
     
     bottomNavigationBar: BottomNavigationBar(
       type: BottomNavigationBarType.fixed,
       backgroundColor:  Color(0xFF69B3BB),
      currentIndex: _currentIndex,
       onTap: _onItemTapped,// this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          label: 'Home',
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
