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

  DateTime dateTime = DateTime.now();
  double weightEntry = 0;
  String unit = 'g';

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
          children: [
            Text("Enter Weight"),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDatePicker(
                        context: context, 
                        initialDate: DateTime.now(), 
                        firstDate: DateTime(2019),
                        lastDate: DateTime(2100))
                        .then((date) {
                          setState(() {
                          dateTime = date!;
                          });
                        });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 3), // changes position of shadow
                        )]
                      ),
                      child: Icon(Icons.calendar_month_rounded)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 8, 2, 12),
                    child: SizedBox(
                      width: 100,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                        ),
                      ),
                    ),
                  ),
                  UnitsDropDown()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UnitsDropDown extends StatefulWidget {
  const UnitsDropDown({Key? key}) : super(key: key);

  @override
  State<UnitsDropDown> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<UnitsDropDown> {
  String dropdownValue = 'g';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      focusColor: Colors.transparent,
      value: dropdownValue,
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 10,
        color: Colors.transparent
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['g','kg', 'lbs', 'oz']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
