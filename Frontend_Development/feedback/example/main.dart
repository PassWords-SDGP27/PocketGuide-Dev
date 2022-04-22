import 'package:flutter/material.dart';
import 'package:quick_feedback/feedback.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void _showFeedback(context) {
    showDialog(
      context: context,
      builder: (context) {
        return QuickFeedback(
          title: 'Leave a feedback', // Title of dialog
          showTextBox: true, // default false
          textBoxHint:
              'Share your feedback', // Feedback text field hint text default: Tell us more
          submitText: 'SUBMIT', // submit button text default: SUBMIT
          onSubmitCallback: (feedback) {
            print('$feedback'); // map { rating: 2, feedback: 'some feedback' }
            Navigator.of(context).pop();
          },
          askLaterText: 'ASK LATER',
          onAskLaterCallback: () {
            print('Do something on ask later click');
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quick Feedback'),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Center(
              child: FlatButton(
                onPressed: () => _showFeedback(context),
                child: Text('Feedback'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
