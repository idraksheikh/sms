import 'package:flutter/material.dart';
import 'package:sms/Screens/styles/font.dart';
import 'package:sms/Screens/styles/font_param.dart';
import 'package:sms/Services/auth.dart';

import 'forget.dart';
import '../widgets/my_button.dart';
import '../widgets/my_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final Authentication _auth = Authentication();
  // text editing controllers
  final _formkey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void loginSucces(context, String registrationId, String password) async {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      if (await _auth.login(registrationId, password)) {
        Navigator.pushReplacementNamed(
          context,
          '/home',
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 251, 255),
      body: SafeArea(
        // child: Image.asset('assets/images/flutterDecodeImage.jpg'),

        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/background.png'),
              Expanded(
                child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 1),

                    // welcome back, you've been missed!
                    const Center(
                      child: ThemeFont(
                          text: 'Login',
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),

                    const SizedBox(height: 20),

                    // username textfield
                    MyTextField(
                        controller: usernameController,
                        hintText: 'Registration Id',
                        obscureText: false,
                        name: 'Registration Id'),

                    const SizedBox(height: 10),

                    // password textfield
                    MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                      name: 'Password',
                    ),

                    const SizedBox(height: 10),

                    Center(
                      child: InkWell(
                        
                          child: Text(
                            "Forget Password ?",
                            style: ThemeFontStyle(fontSize: 18).style,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Forget()));
                          }),
                    ),

                    const SizedBox(height: 25),

                    // sign in button
                    MyButton(
                      onTap: () {
                        loginSucces(context, usernameController.text,
                            passwordController.text);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
