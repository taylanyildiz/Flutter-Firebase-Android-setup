import 'package:flutter/material.dart';
import 'package:flutter_firebase_android_setup/services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthService _service = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Log Out',
          style: TextStyle(
            color: Colors.red,
            fontSize: 18.0,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await _service.signOut();
            },
            child: Text(
              'Log out',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
