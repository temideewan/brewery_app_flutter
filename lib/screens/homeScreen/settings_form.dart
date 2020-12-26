import 'package:flutter/material.dart';

import 'package:firebase_app/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  String _currentName;
  String _currentSugars;
  int _currentStrength;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Text('Update your brew settings', style: TextStyle(fontSize: 18.0)),
            SizedBox(height: 20.0),
            TextFormField(
                decoration: textInputDeclaration,
                validator: (value) =>
                    value.isEmpty ? 'Please enter a name' : null,
                onChanged: (value) => setState(() => _currentName = value)),
            SizedBox(height: 20.0),
            // dropdoown here
            DropdownButtonFormField(
                value: _currentSugars ?? '0',
                elevation: 2,
                isDense: true,
                isExpanded: false,
                autofocus: false,
                decoration: textInputDeclaration,
                iconSize: 20.0,
                items: sugars.map((sugar) {
                  return DropdownMenuItem(
                      child: Text('$sugar sugars'), value: sugar);
                }).toList(),
                onChanged: (value) {
                  setState(() => _currentSugars = value);
                }),

            // Slider for strength

            RaisedButton(
                color: Colors.pink,
                child: Text('update', style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  print(_currentName);
                  print(_currentSugars);
                  print(_currentStrength);
                })
          ],
        ));
  }
}
