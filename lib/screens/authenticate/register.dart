import 'package:flutter/material.dart';
import 'package:flutter_firebase_android_setup/services/auth_service.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();

  TextEditingController? _controllerMail;
  TextEditingController? _controllerPassword;

  final _focusNode = FocusNode();

  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    _controllerMail = TextEditingController();
    _controllerPassword = TextEditingController();
  }

  AuthService _service = AuthService();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40.0),
              child: Text(
                'Firebase Register exam.',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      autofocus: true,
                      validator: (input) =>
                          input!.isEmpty ? 'You must entry mail' : null,
                      controller: _controllerMail,
                      decoration: InputDecoration(
                        labelText: 'email',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      obscureText: isVisible,
                      validator: (input) =>
                          input!.isEmpty ? 'You must entry password' : null,
                      focusNode: _focusNode,
                      controller: _controllerPassword,
                      decoration: InputDecoration(
                          labelText: 'password',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.orange,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () =>
                                setState(() => isVisible = !isVisible),
                            icon: Icon(
                              isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.red,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: size.width * .8,
                child: MaterialButton(
                  onPressed: () async {
                    formKey.currentState!.validate();
                    if (_controllerMail!.text.isNotEmpty &&
                        _controllerPassword!.text.isEmpty) {
                      FocusScope.of(context).requestFocus(_focusNode);
                    }
                    if (_controllerMail!.text.isNotEmpty &&
                        _controllerPassword!.text.isNotEmpty) {
                      FocusScope.of(context).unfocus();
                      final email = _controllerMail!.text;
                      final password = _controllerPassword!.text;
                      print('email : $email');
                      print('password : $password');
                      try {
                        await _service.registerWithMailPassword(
                            email, password);
                      } catch (e) {
                        print(e.toString());
                      }
                    }
                  },
                  child: Text('Register'),
                  color: Colors.red,
                  textColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
