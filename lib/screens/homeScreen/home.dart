import 'package:firebase_app/models/brew.dart';
import 'package:firebase_app/screens/homeScreen/brew_list.dart';
import 'package:firebase_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_app/services/database.dart';

class Home extends StatelessWidget {
  final AuthService _auth = new AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
          backgroundColor: Colors.brown[50],
          appBar: AppBar(
            title: Text('Brew crew'),
            backgroundColor: Colors.brown[400],
            elevation: 0.0,
            actions: [
              FlatButton.icon(
                  onPressed: () async {
                    await _auth.signOut();
                  },
                  icon: Icon(Icons.person),
                  label: Text('Logout'))
            ],
          ),
          body: BrewList()),
    );
  }
}
