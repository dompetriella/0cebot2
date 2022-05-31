import 'package:flutter/material.dart';

class OcebotTheme {

  static Color backgroundColor = Colors.black38;
  static Color primaryColor = Color.fromARGB(255, 200, 126, 14);
  static Color accentColor = Colors.green;

  static ThemeData get darkTheme 
  { //1
    return ThemeData( //2
      primaryColor: primaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      primaryTextTheme: TextTheme(
        headline1: TextStyle(
          color: Colors.white
        ),
      ),
      scaffoldBackgroundColor: Colors.black26,
      fontFamily: 'Montserrat', //3
      buttonTheme: ButtonThemeData( // 4
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: accentColor,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: accentColor
      )
    );
  }
}