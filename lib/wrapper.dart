import 'package:flutter/material.dart';
import 'package:flutter_firebase_android_setup/models/users_model.dart';
import 'package:flutter_firebase_android_setup/screens/authenticate/authenticate.dart';
import 'package:flutter_firebase_android_setup/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);
    return user != null ? HomeScreen() : Authenticate();
  }
}
