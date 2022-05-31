import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ocebot/themes.dart';

class EntryForm extends StatefulWidget {
  const EntryForm({Key? key}) : super(key: key);

  @override
  State<EntryForm> createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      
      backgroundColor: OcebotTheme.darkTheme.backgroundColor,
      elevation: 5.0,
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),

        TextButton(
        onPressed: () => Navigator.pop(context, 'OK'),
        child: const Text('OK'),
        ),
      ],
      content: SizedBox(
        width: 300,
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Enter Weight"),
            TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
              ),
            ),
          ],
        ),
      ),
    );
  }
}