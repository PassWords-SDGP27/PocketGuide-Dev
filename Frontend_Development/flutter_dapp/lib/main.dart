import 'package:flutter/material.dart';
import 'package:flutter_dapp/contractLikings/contractLinking.dart';
import 'package:flutter_dapp/pages/homePage.dart';

import 'package:flutter_dapp/pages/loginPage.dart';
import 'package:flutter_dapp/providers/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth(),),
        ChangeNotifierProvider.value(value: ContractLinking(),),
      ],
      child:Consumer<Auth>(
    builder: (ctx,auth, _)=> MaterialApp(
      title: "Pocket Guide",
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Color.fromRGBO(72, 72, 72, 1),
            fontSize: 12,
          ),
        ),
      ),
      initialRoute: auth.isAuth ? '/': LoginPage.routeName ,

    routes: {
        '/' : (ctx) => HomePage(),
    LoginPage.routeName : (ctx) => LoginPage(),

    },
    ),),);
  }
}

