import 'package:flutter/material.dart';

import '../styles/font.dart';
import '../styles/font_param.dart';
import '../widgets/my_button.dart';
import '../widgets/my_textfield.dart';

class Forget extends StatefulWidget {
  Forget({super.key});

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  // text editing controllers
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final passwordController1 = TextEditingController();

  final passwordController2 = TextEditingController();
  
  // text editing controllers
  final _formkey = GlobalKey<FormState>();

  // sign user in method
  void signUserIn() {}

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
              Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // alignment: Alignment.centerLeft,
                height: 20,
                width: 20,
                margin: const EdgeInsets.only(top: 40, left: 20),
                child: InkWell(
                  onTap: (() async {
                    Navigator.pop(context);
                  }),
                  child: const Image(
                    color:  Color.fromRGBO(30,166,198,1),
                    image: AssetImage('assets/images/leftarrow.png'),
                  ),
                ),
              ),
              
              const Text(''),
              const Text(''),
            ],
          ),
              const SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.center,
                height: 150,
                width: 150,
                child: const Image(
                  image: AssetImage('assets/images/login2.png'),
                ),
              ),
                const SizedBox(
                height: 100,
              ),
              Expanded(
                child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 1),

                    // welcome back, you've been missed!
                    const Center(
                      child: ThemeFont(
                          text: 'Forget Password ?',
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

                   
                    const SizedBox(height: 25),

                    // sign in button
                    MyButton(
                      text: "Submit",
                      onTap: () {
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );}
}
