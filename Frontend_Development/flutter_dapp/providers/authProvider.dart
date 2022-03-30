
import 'package:flutter/cupertino.dart';

class Auth with ChangeNotifier{
  String? _email;
  String? _password;
  String? _username;
  String? _telNo;
  late bool isLogged;

  String? get email => _email;

  String? get password => _password;

  String? get username => _username;

  String? get telNo => _telNo;


}