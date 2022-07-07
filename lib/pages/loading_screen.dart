import 'package:flutter/material.dart';
import 'package:ocebot/themes.dart';
import 'package:ocebot/themes.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: OcebotTheme.backgroundColor,
        child: Center(
          child: CircularProgressIndicator(
            color: OcebotTheme.primaryColor,
          ),
        ),
      ),
    );
  }
}