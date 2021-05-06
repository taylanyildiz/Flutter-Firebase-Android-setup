import 'package:flutter/material.dart';
import 'package:flutter_firebase_android_setup/services/auth_service.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthService _service = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () async {
                final user = await _service.signInAnon();
                if (user != null) {
                  print('successful signing');
                  print(user);
                } else {
                  print('failed sign');
                }
              },
              child: Text('Sign in'),
              color: Colors.red,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
