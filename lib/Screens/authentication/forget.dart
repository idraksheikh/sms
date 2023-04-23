import 'package:flutter/material.dart';

import '../widgets/my_textfield.dart';

class Forget extends StatelessWidget {
  Forget({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordController1 = TextEditingController();
  final passwordController2 = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 251, 255),
      body: SafeArea(
        // child: Image.asset('assets/images/flutterDecodeImage.jpg'),

        child: Column(
          children: [
            Image.asset('assets/images/background.png'),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 1),

                  // welcome back, you've been missed!
                  const Text(
                    'Enter Details',
                    style: TextStyle(
                      color: Color.fromARGB(255, 19, 14, 14),
                      fontSize: 25,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // username textfield
                  MyTextField(
                    controller: usernameController,
                    hintText: 'Registration Id',
                    obscureText: false,
                    name:'Registration Id',
                  ),

                  const SizedBox(height: 10),
                  MyTextField(
                    controller: passwordController1,
                    hintText: 'New Password',
                    obscureText: true,
                    name: 'New Password',
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: passwordController2,
                    hintText: 'Confirm Password',
                    obscureText: true,
                    name: 'Confirm Password',
                  ),
                  const SizedBox(height: 10),

                  ElevatedButton(
                    
                      //style:ButtonStyle(backgroundColor: MaterialStateProperty(color:Colors.accents),),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: const Text('Submit')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
