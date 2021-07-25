import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoop_seek/utils/constants.dart';

class BrandTheme {
  static Color colorPrimary = Color(0xFF0066FF);
  static Color colorBackground = Color(0xFF181818);
  static Color colorPrimaryLight = Color(0xFF232323);
  static Color colorHighlight = Colors.white;
  static String? brandFont =
      GoogleFonts.rubik(fontWeight: FontWeight.bold).fontFamily;
  static bool isLight = false;
  static Color colorFont = Colors.white;
  static Color colorDisabled = Colors.grey.shade400;
  static Color colorSubTitle = Colors.grey.shade700;

  static ThemeData get darkTheme {
    colorFont = Colors.white;
    colorPrimary = Color(0xFF0066FF);
    colorBackground = Color(0xFF181818);
    colorPrimaryLight = Color(0xFF232323);
    colorHighlight = Colors.white;
    colorDisabled = Colors.grey.shade700;
    colorSubTitle = Colors.grey.shade400;
    isLight = false;
    return ThemeData.dark().copyWith(
        //2
        
        primaryColor: colorPrimary,
        primaryColorDark: Colors.black,
        primaryColorLight: colorPrimaryLight,
        textTheme: ThemeData.dark().textTheme.apply(fontFamily: brandFont),
        scaffoldBackgroundColor: colorBackground,
        bottomAppBarTheme: BottomAppBarTheme(
          
        ),
        primaryTextTheme:
            ThemeData.dark().textTheme.apply(fontFamily: brandFont),
        accentTextTheme:
            ThemeData.dark().textTheme.apply(fontFamily: brandFont),
        //3
        buttonTheme: ButtonThemeData(
          focusColor: colorPrimary,
          splashColor: colorPrimary,
          highlightColor: colorHighlight,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: colorPrimary,
        ));
  }

  static ThemeData get lightTheme {
    colorFont = Color(0xFF181818);
    colorPrimary = Color(0xFF0066FF);
    colorBackground = Colors.grey.shade100;
    colorPrimaryLight = Colors.grey.shade200;
    colorHighlight = Colors.blue;
    colorDisabled = Colors.grey.shade400;
    colorSubTitle = Colors.grey.shade700;
    isLight = true;

    return ThemeData.light().copyWith(
        //2

        primaryColor: colorPrimary,
        primaryColorDark: Colors.black,
        primaryColorLight: colorPrimaryLight,
        textTheme: ThemeData.light()
            .textTheme
            .apply(fontFamily: brandFont, bodyColor: colorFont),
        scaffoldBackgroundColor: colorBackground,
        primaryTextTheme: ThemeData.light()
            .textTheme
            .apply(fontFamily: brandFont, bodyColor: colorFont),
        accentTextTheme: ThemeData.light()
            .textTheme
            .apply(fontFamily: brandFont, bodyColor: colorFont),
        //3
        buttonTheme: ButtonThemeData(
          focusColor: colorPrimary,
          splashColor: colorPrimary,
          highlightColor: colorHighlight,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: colorPrimary,
        ));
  }

  bool get isLightTheme => isLight;
}
