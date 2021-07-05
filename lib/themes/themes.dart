import 'package:flutter/material.dart';


class AppTheme {
  static ThemeData get darkTheme { //1
    return ThemeData( //2
      primaryColor: Color(0xFF0066FF),
      scaffoldBackgroundColor: Color(0xFF181818),
      fontFamily: 'Rubik', //3
      buttonTheme: ButtonThemeData( // 4
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: Color(0xFF0066FF),
      )
    );
  }
}