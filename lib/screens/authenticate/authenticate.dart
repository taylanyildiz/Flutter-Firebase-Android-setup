import 'package:flutter/material.dart';
import 'package:flutter_firebase_android_setup/screens/authenticate/register.dart';
import 'package:flutter_firebase_android_setup/screens/authenticate/sing_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  final _screens = <Widget>[
    SignIn(),
    Register(),
  ];

  int currentPage = 0;

  PageController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: currentPage == 0 ? Text('SignIn') : Text('Register'),
        actions: [
          currentPage == 0
              ? TextButton(
                  onPressed: () => _controller!.nextPage(
                      duration: Duration(seconds: 1), curve: Curves.linear),
                  child: Text(
                    'register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
              : SizedBox.shrink(),
        ],
        leading: currentPage != 0
            ? IconButton(
                onPressed: () => _controller!.animateToPage(0,
                    duration: Duration(seconds: 1), curve: Curves.linear),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              )
            : SizedBox.shrink(),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 2,
              onPageChanged: (page) => setState(() => currentPage = page),
              itemBuilder: (context, index) => _screens[index],
            ),
          ),
        ],
      ),
    );
  }
}
