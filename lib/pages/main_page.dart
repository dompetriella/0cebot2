import 'package:flutter/material.dart';
import '../themes.dart';
import 'entry_form.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ocebot/providers/auth_provider.dart';

class MainPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      shape: BoxShape.rectangle,
                      color: OcebotTheme.accentColor),
                ),
              ),
              const Text("Ocebot"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: OcebotTheme.accentColor),
                ),
              ),
            ],
          )),
      body: SafeArea(
        child: Center(
            child: Text("No Data Yet!",
                style: OcebotTheme.lightTheme.primaryTextTheme.headline1)),
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