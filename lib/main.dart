import 'package:flutter/material.dart';
import 'themes.dart';
import 'entry_form.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ocebot',
      theme: OcebotTheme.lightTheme,
      home: AuthenticationWrapper(),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: OcebotTheme.primaryColor,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: OcebotTheme.pixelShadow
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 100, 40, 100),
              child: SizedBox(
                height: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Ocebot",
                      style: OcebotTheme.lightTheme.primaryTextTheme.headlineLarge,
                    ),
                    Image.asset(
                      'assets/images/Ocelot-export.png',
                      ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: OcebotTheme.lightTheme.primaryTextTheme.displayMedium,
                        fixedSize: Size(250, 50),
                      ),
                      onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage()),
                        );
                      },
                      child: Text("Sign In"))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
          title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle, color: OcebotTheme.accentColor),
            ),
          ),
          Text("Ocebot"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle, color: OcebotTheme.accentColor),
            ),
          ),
        ],
      )),
      body: Center(
        child: Text("No Data Yet!",
          style: OcebotTheme.lightTheme.primaryTextTheme.headline1)
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(),
        onPressed: () => showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => EntryForm()),
        tooltip: 'Create New Entry',
        child: const Icon(Icons.add),
      ),
    );
  }
}
