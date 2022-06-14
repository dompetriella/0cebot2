import 'package:flutter/material.dart';
import 'themes.dart';
import 'entry_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ocebot',
      theme: OcebotTheme.lightTheme,
      home: const MyHomePage(title: 'OceBot'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          Text(widget.title),
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
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("No Data Yet!", style: OcebotTheme.lightTheme.primaryTextTheme.headline1)],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(),
        onPressed: () => showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => EntryForm()),
        tooltip: 'Create New Entry',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
