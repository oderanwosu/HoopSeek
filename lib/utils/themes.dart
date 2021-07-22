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
  static Color colorFont = Colors.white;
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
        //2

        primaryColor: colorPrimary,
        primaryColorDark: Colors.black,
        primaryColorLight: colorPrimaryLight,
        textTheme: ThemeData.dark().textTheme.apply(fontFamily: brandFont),
        scaffoldBackgroundColor: colorBackground,
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
}
