import 'package:flutter/material.dart';

class PageTopTitle extends StatelessWidget {
  late String _title;
  late String _description;
  late Color _titleColor;
  late Color _descriptionColor;

  PageTopTitle(
      {required String title,
        required String description,
        required Color titleColor,
        required Color descriptionColor}) {
    this._title = title;
    this._description = description;
    this._titleColor = titleColor;
    this._descriptionColor = descriptionColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            _title,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: _titleColor),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              _description,
              style: TextStyle(
                fontSize: 16,
                color: _descriptionColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}