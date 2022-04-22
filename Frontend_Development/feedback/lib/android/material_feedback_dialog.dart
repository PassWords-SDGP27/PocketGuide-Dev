import 'package:flutter/material.dart';
import '../widgets/feedback_title.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/feedback_content.dart';
import 'package:quick_feedback/feedback.dart';

class MaterialFeedbackDialog extends StatelessWidget {
  final TextField feedbackTextBox;

  final List<Widget> stars;

  final QuickFeedback widget;

  final Icon currentFace;

  final int rating;

  final TextEditingController feedbackEditingController;

  MaterialFeedbackDialog({
    @required this.stars,
    @required this.widget,
    @required this.rating,
    @required this.currentFace,
    @required this.feedbackTextBox,
    @required this.feedbackEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: FeedbackTitle(widget: widget, currentFace: currentFace),
      content: FeedbackContent(
        stars: stars,
        widget: widget,
        textBoxWidget: feedbackTextBox,
      ),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
            if (widget.onAskLaterCallback is Function) {
              widget.onAskLaterCallback();
            }
          },
          child: Text(widget.askLaterText),
        ),
        FlatButton(
          onPressed: () => widget.onSubmitCallback({
            'rating': rating,
            'feedback': feedbackEditingController.text,
          }),
          child: Text(widget.submitText),
        )
      ],
    );
  }
}
