import 'package:flutter/material.dart';

import '../styles/font.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final String name;
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        validator: (value) {
          if (name == 'Registration Id') {
            if (value!.isEmpty) {
              return 'Please enter Registration Id.';
            }
            if (!(((value.startsWith('ST')) ||
                    (value.startsWith('TA')) ||
                    (value.startsWith('AD'))) &&
                (value.length == 11))) {
              return 'Please enter valid Registration Id.';
            }
          } else {
            if (value!.isEmpty) {
              return 'Please enter $name.';
            }
            if (value.length < 5) {
              return 'Please enter valid $name.';
            }
          }
          return null;
        },
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: ThemeFontStyle(fontSize: 12,color: Colors.blueGrey.shade800,).style,
        ),
        //TextStyle(color: Color.fromARGB(255, 14, 12, 12))),
      ),
    );
  }
}
