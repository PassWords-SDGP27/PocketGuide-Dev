import 'package:flutter/material.dart';

class ErrorAlertDialogWidget extends StatelessWidget {
  late String _title ;
  late String _message;

  ErrorAlertDialogWidget({required String title, required String message}){
    _title = title;
    _message = message;
  }


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_title),
      content: Text(_message),
      actions: [
        TextButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: Text("OK" , style: TextStyle(color: Color.fromRGBO(0, 51, 52, 1),fontWeight: FontWeight.bold),),),
      ],
    );

  }
}