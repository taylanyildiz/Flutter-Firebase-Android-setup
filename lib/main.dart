import 'package:flutter/material.dart';
import 'package:flutter_firebase_android_setup/screens/authenticate/sing_in.dart';
import 'screens/screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<Widget> checkUserLog() async {
    return SignIn();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Firebase Android Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder<Widget>(
          future: checkUserLog(),
          builder: (context, snapshots) {
            if (snapshots.hasData) {
              return snapshots.data!;
            } else {
              return Container();
            }
          },
        ));
  }
}
