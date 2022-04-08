


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
//import 'package:http/http.dart' as http;


class Auth with ChangeNotifier {
  String? _userId;
  String? _fullName;
  String? _email;
  String? _contactNo;
  String? _picture;
  String? _education;
  String? _university;
  String? _registeredDate;
  late bool _status = true;

  bool get isAuth {
    return _status;
  }

  String get userId => _userId!;

  String get fullName => _fullName!;

  String get email => _email!;

  String get contactNo => _contactNo!;

  String get picture => _picture!;

  String get education => _education!;

  String get university => _university!;

  String get registeredDate => _registeredDate!;

  Future<void> login(
      {required String email,
        required String password,
        }) async {
    // var url = Uri.parse('${BaseUrl.url}/MobileAPI/Login');
    // Map data = {'email': email, 'password': password, 'deviceID': deviceId};
    // var requestData = json.encode(data);
    //
    // var response = await http.post(
    //   url,
    //   body: requestData,
    //   headers: {
    //     "Content-Type": "application/json",
    //    },
    // );
    //
    // if (response.statusCode == 200) {
    //   final responseData = json.decode(response.body);
    //   _userId = responseData['id'];
    //   _fullName = responseData['fullName'];
    //   _email = responseData['email'];
    //   _contactNo = responseData['contactNo'];
    //   _picture = responseData['picture'];
    //   _education = responseData['education'];
    //   _university = responseData['university'];
    //   _registeredDate = responseData['registeredDate'];
    //   if (responseData['status'] == 'Active')
    //     _status = true;
    //   else
    //     _status = true;
    // } else if (response.statusCode == 201) {
    //   throw HttpException(response.body);
    // } else if (response.statusCode == 500) {
    //   throw HttpException("Something went wrong. Please try again later.");
    // } else {
    //   throw HttpException("Error");
    // }

    notifyListeners();
  }



  void logout(BuildContext context) {
    _fullName = null;
    _email = null;
    _contactNo = null;
    _picture = null;
    _education = null;
    _university = null;
    _registeredDate = null;
    _status = false;

    notifyListeners();
  }
}
