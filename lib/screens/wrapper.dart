import 'package:firebase_app/models/user_model.dart';
import 'package:firebase_app/screens/authenticate/authenticate.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import 'homeScreen/home.dart';

// import 'homeScreen/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return either home or authenticate
    final user = Provider.of<User>(context);
    print(user);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
