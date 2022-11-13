import 'package:flutter/material.dart';
import 'package:kashare/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> distance = ['0', '1', '2', '3', '4'];

  // form values
  String? _currentName;
  String? _currentDestination;
  int? _currentDistance;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Update your brew settings.',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val) => val!.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(height: 10.0),
          DropdownButtonFormField(
            value: _currentDistance ?? '0',
            decoration: textInputDecoration,
            items: distance.map((distance) {
              return DropdownMenuItem(
                value: distance,
                child: Text('$distance distance'),
              );
            }).toList(),
            onChanged: (val) => setState(() => _currentDestination),
          ),
          SizedBox(height: 10.0),
          ElevatedButton(
              child: Text(
                'Find Pool',
                style: TextStyle(color: Colors.green),
              ),
              onPressed: () async {
                print(_currentName);
                print(_currentDestination);
              }),
          ElevatedButton(
              child: Text(
                'Offer Pool',
                style: TextStyle(color: Colors.green[400]),
              ),
              onPressed: () async {
                print(_currentName);
                print(_currentDestination);
              }),
        ],
      ),
    );
  }
}
