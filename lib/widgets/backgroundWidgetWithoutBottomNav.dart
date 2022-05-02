import 'package:flutter/material.dart';

class BackgroundWidgetWithoutBottomNav extends StatelessWidget {
  late Widget _body;
  late Color _backgroundColor;
  late String _img;
  BackgroundWidgetWithoutBottomNav({
    required Widget body,
    required Color backgroundColor,
    required String img,
  }) {
    this._body = body;
    this._backgroundColor = backgroundColor;
    this._img = img;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _backgroundColor,
      ),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topRight,
            image: AssetImage(_img),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: _body,
        ),
      ),
    );
  }
}