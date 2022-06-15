import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ocebot/themes.dart';
import 'package:sqflite/sqflite.dart';

class EntryForm extends StatefulWidget {
  const EntryForm({Key? key}) : super(key: key);

  @override
  State<EntryForm> createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  DateTime entryDateTime = DateTime.now();
  String entryWeight = "";
  String entryUnits = 'g';
  TextEditingController textEditingController = TextEditingController();
  double displayWidth = 350;
  double displayHeight = 200;

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: OcebotTheme.backgroundColor,
      elevation: 5.0,
      titleTextStyle: GoogleFonts.vt323(),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            var snackbar = SnackBar(
              content: Text('Added Entry: ${entryDateTime.toIso8601String().split('T').first} - ${entryWeight}${entryUnits}'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
            Navigator.pop(context, 'OK');
          },
          child: const Text('OK'),
        ),
      ],
      content: SizedBox(
        width: displayWidth,
        height: displayHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                width: displayWidth,
                color: OcebotTheme.primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text("Enter Weight",
                        style:
                            OcebotTheme.lightTheme.primaryTextTheme.headline3),
                  ),
                )),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDatePicker(
                              builder: (context, child) {
                                return Theme(
                                    data: OcebotTheme.lightTheme,
                                    child: child!);
                              },
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2019),
                              lastDate: DateTime(2100))
                          .then((date) {
                        setState(() {
                          entryDateTime = date ?? DateTime.now();
                        });
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: OcebotTheme.primaryColor,
                            shape: BoxShape.rectangle,
                            boxShadow: [
                              BoxShadow(
                                color: OcebotTheme.tertiaryColor,
                                spreadRadius: 0,
                                blurRadius: 0,
                                offset:
                                    Offset(-4, 1), // changes position of shadow
                              ),
                              BoxShadow(
                                color: OcebotTheme.tertiaryColor,
                                spreadRadius: 0,
                                blurRadius: 0,
                                offset:
                                    Offset(4, 0), // changes position of shadow
                              ),
                              BoxShadow(
                                color: OcebotTheme.tertiaryColor,
                                spreadRadius: 0,
                                blurRadius: 0,
                                offset:
                                    Offset(1, -4), // changes position of shadow
                              ),
                              BoxShadow(
                                color: OcebotTheme.tertiaryColor,
                                spreadRadius: 0,
                                blurRadius: 0,
                                offset:
                                    Offset(0, 4), // changes position of shadow
                              ),
                              BoxShadow(
                                color: OcebotTheme.secondaryColor,
                                spreadRadius: 0,
                                blurRadius: 0,
                                offset:
                                    Offset(-2, 1), // changes position of shadow
                              ),
                              BoxShadow(
                                color: OcebotTheme.secondaryColor,
                                spreadRadius: 0,
                                blurRadius: 0,
                                offset:
                                    Offset(2, 0), // changes position of shadow
                              ),
                              BoxShadow(
                                color: OcebotTheme.secondaryColor,
                                spreadRadius: 0,
                                blurRadius: 0,
                                offset:
                                    Offset(1, -2), // changes position of shadow
                              ),
                              BoxShadow(
                                color: OcebotTheme.secondaryColor,
                                spreadRadius: 0,
                                blurRadius: 0,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ]),
                        child: Icon(
                          Icons.calendar_month_rounded,
                          color: OcebotTheme.backgroundColor,
                            )),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(12, 8, 2, 12),
                    child: SizedBox(
                      width: 100,
                      child: TextField(
                        style: OcebotTheme
                            .lightTheme.primaryTextTheme.displayMedium,
                        textAlign: TextAlign.center,
                        controller: textEditingController,
                        onChanged: (text) {
                          setState(() {
                            entryWeight = text;
                          });
                        },
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
      style: GoogleFonts.vt323(fontSize: 25, color: OcebotTheme.primaryColor),
      underline: Container(height: 10, color: Colors.transparent),
      onChanged: (String? entryUnits) {
        setState(() {
          dropdownValue = entryUnits!;
        });
      },
      items: <String>['g', 'kg', 'lbs', 'oz']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
