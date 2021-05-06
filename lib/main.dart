import 'package:flutter/material.dart';
import 'package:flutter_firebase_android_setup/models/users_model.dart';
import 'package:flutter_firebase_android_setup/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase_android_setup/wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<Users?>.value(
          value: AuthService().user,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Firebase Android Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Wrapper(),
      ),
    );
  }
}
