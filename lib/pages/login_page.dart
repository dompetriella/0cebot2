import 'package:flutter/material.dart';
import 'package:ocebot/firebase_options.dart';
import 'package:ocebot/providers/auth_provider.dart';
import 'package:ocebot/themes.dart';
import 'entry_form.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main_page.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final _auth = ref.watch(authenticationProvider);

    Future<void> _loginWithGoogle() async {
      await _auth
        .signInWithGoogle(context)
        .whenComplete(() => _auth.authStateChange.listen((event) async { 
          if (event == null) {
            return;
          }
        }));
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: OcebotTheme.primaryColor,
          child: Center(
            child: Container(
              decoration: BoxDecoration(boxShadow: OcebotTheme.pixelShadow),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  screenWidth * .1, screenHeight * .20, screenWidth * .10, screenHeight * .20),
                child: SizedBox(
                  height: 350,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Ocebot",
                        style:
                            OcebotTheme.lightTheme.primaryTextTheme.headlineLarge,
                      ),
                      Image.asset(
                        'assets/images/Ocelot-export.png',
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            textStyle: OcebotTheme
                                .lightTheme.primaryTextTheme.displayMedium,
                            fixedSize: Size(250, 50),
                          ),
                          onPressed: () {
                            _loginWithGoogle();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MainPage()),
                            );
                          },
                          child: Text("Sign In (Google)"))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


