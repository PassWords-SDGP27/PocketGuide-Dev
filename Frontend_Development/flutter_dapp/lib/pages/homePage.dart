import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_dapp/models/recommended_model.dart';
import 'package:flutter_dapp/widgets/bottom_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/homeScreen';
  /// Page Controller
  final _pageController = PageController(viewportFraction: 0.877);
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff0E4B79),
      bottomNavigationBar: BottomNavigationBarTravel(),
      body: Container(
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
        child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              /// Text Widget for Title
              Padding(
                padding: EdgeInsets.only(top: 32, left: 28.8),
                child: Text(
                  'Pocket Guide\nExplore\nSri Lanka',
                  style: GoogleFonts.playfairDisplay(
                      fontSize: 45.6, fontWeight: FontWeight.w700),
                ),
              ),

              /// Custom Tab bar with Custom Indicator
              Container(
                height: 30,
                margin: EdgeInsets.only(left: 14.4, top: 28.8),
                child: DefaultTabController(
                  length: 3,
                  child: TabBar(
                      labelPadding: EdgeInsets.only(left: 16.4, right: 16.4),
                      indicatorPadding:
                          EdgeInsets.only(left: 16.4, right: 16.4),
                      isScrollable: true,
                      labelColor: Color(0xFF000000),
                      unselectedLabelColor: Colors.white,
                      labelStyle: GoogleFonts.lato(
                          fontSize: 14, fontWeight: FontWeight.w700),
                      unselectedLabelStyle: GoogleFonts.lato(
                          fontSize: 14, fontWeight: FontWeight.w700),
                  
                       tabs: [
                        Tab(
                          child: Container(
                            child: Text('Recommended'),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: Text('Popular'),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: Text('New Destination'),
                          ),
                        ),
                      ]),
                ),
              ),

              /// ListView widget with PageView
              /// Recommendations Section
              Container(
                height: 218.4,
                margin: EdgeInsets.only(top: 16),
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    recommendations.length,
                    (int index) => GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(right: 28.8),
                        width: 333.6,
                        height: 218.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                                recommendations[index].image),
                          ),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 19.2,
                              left: 19.2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.8),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaY: 19.2, sigmaX: 19.2),
                                  child: Container(
                                    height: 36,
                                    padding: EdgeInsets.only(
                                        left: 16.72, right: 14.4),
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        SvgPicture.asset(
                                            'assets/svg/icon_location.svg'),
                                        SizedBox(
                                          width: 9.52,
                                        ),
                                        Text(
                                          recommendations[index].name,
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              fontSize: 16.8),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              /// Dots Indicator
              /// Using SmoothPageIndicator Library
              Padding(
                padding: EdgeInsets.only(left: 28.8, top: 28.8),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: recommendations.length,
                  effect: ExpandingDotsEffect(
                      activeDotColor: Color(0xFF8a8a8a),
                      dotColor: Color(0xFFababab),
                      dotHeight: 4.8,
                      dotWidth: 6,
                      spacing: 4.8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
