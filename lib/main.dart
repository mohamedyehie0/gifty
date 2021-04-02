import 'package:flutter/material.dart';

import 'loadingScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color.fromRGBO(228, 180, 180, 1)
      ),
      home: loadingScreen(),
    );
  }
}