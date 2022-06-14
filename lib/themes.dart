import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OcebotTheme {

  static Color primaryColor = Color(0xff3F612D);
  static Color secondaryColor = Color(0xff96BE8C);
  static Color tertiaryColor = Color(0xffACECA1);
  static Color backgroundColor = Color(0xffC9F2C7);
  static Color accentColor = Color(0xffC36F09);
  static Color textColor = Colors.black;

  static ThemeData get lightTheme 
  { //1
    return ThemeData( //2
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        secondary: backgroundColor,
        onSurface: primaryColor,
        surface: backgroundColor
      ),
      dialogBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: backgroundColor,
        titleTextStyle: GoogleFonts.vt323(
          color: backgroundColor,
          fontSize: 30
        )
        
      ),
      primaryTextTheme: TextTheme(
        headline1: GoogleFonts.vt323(
          fontSize: 40,
          color: primaryColor
        ),
        headline2: GoogleFonts.vt323(
          fontSize: 30,
          color: primaryColor
        ),
        headline3: GoogleFonts.vt323(
          fontSize: 30,
          color: backgroundColor
        ),
      ),
      scaffoldBackgroundColor: backgroundColor,
      buttonTheme: ButtonThemeData( // 4
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        buttonColor: accentColor,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: accentColor
      )
    );
  }
}