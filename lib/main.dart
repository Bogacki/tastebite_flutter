import 'package:flutter/material.dart';

import './helpers/colors.dart';
import './screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: CustomColors.primaryColor,
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 26,
                fontFamily: 'PlayfairDisplay',
                fontWeight: FontWeight.w700,
                color: Colors.black),
          )),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
