import 'package:flutter/material.dart';
import 'package:hoop_seek/screens/authentication/login.dart';
import 'package:hoop_seek/screens/home.dart';
import 'package:hoop_seek/screens/map.dart';
import 'package:hoop_seek/utils/themes.dart';

import 'screens/authentication/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: BrandTheme.lightTheme,
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/login': (context) => Login(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/register': (context) => Register(),
        '/map': (context) => MapScreen(),
      },
      home: HomeScreen(),
    );
  }
}
