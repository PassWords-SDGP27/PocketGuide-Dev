import 'package:flutter/material.dart';
import 'package:quick_feedback/feedback.dart';

class FeedbackContent extends StatelessWidget {
  final List<Widget> stars;

  final QuickFeedback widget;

  final Widget textBoxWidget;

  FeedbackContent({
    @required this.stars,
    @required this.widget,
    @required this.textBoxWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: stars,
        ),
        Visibility(
          visible: widget.showTextBox,
          child: textBoxWidget,
        )
      ],
    );
  }
}
