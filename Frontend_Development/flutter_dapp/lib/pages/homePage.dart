import "package:flutter/material.dart";
import 'package:flutter_dapp/pages/homeSubPages/ARTourGuide.dart';
import 'package:flutter_dapp/pages/homeSubPages/feedbackPage.dart';
import 'package:flutter_dapp/pages/homeSubPages/locationSelectorPage.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/homeScreen';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List _children = [ARTourGuidePage(), LocationSelectorPage(), FeedbackPage() ];
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex  = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pocket Guide"),),
     body: _children[_currentIndex],
     bottomNavigationBar: BottomNavigationBar(
      currentIndex: _currentIndex,
       onTap: _onItemTapped,// this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          label: 'Tour Guide',
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.mail),
          label: 'Locations',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Feedback '
        )
      ],

    ),

    );
  }
}
