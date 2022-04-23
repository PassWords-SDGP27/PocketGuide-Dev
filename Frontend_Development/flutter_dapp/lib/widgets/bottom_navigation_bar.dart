import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavigationBarTravel extends StatefulWidget {
  @override
  _BottomNavigationBarTravelState createState() =>
      _BottomNavigationBarTravelState();
}

class _BottomNavigationBarTravelState extends State<BottomNavigationBarTravel> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var bottomNavStyle =
      GoogleFonts.lato(fontSize: 12, fontWeight: FontWeight.w500);

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
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(1.0),
                spreadRadius: 2,
                blurRadius: 15,
                offset: Offset(0, 5))
          ]),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: _selectedIndex == 0
                  ? new SvgPicture.asset('assets/svg/icon_home_colored.svg')
                  : new SvgPicture.asset('assets/svg/icon_home.svg'),
              label: 'Home'),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? new SvgPicture.asset('assets/svg/icon_plus_colored.svg')
                : new SvgPicture.asset('assets/svg/icon_plus.svg'),
            label: 'Plus',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? new SvgPicture.asset('assets/svg/icon_user_colored.svg')
                : new SvgPicture.asset('assets/svg/icon_user.svg'),
            label: 'User',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
      ),
    );
  }
}
