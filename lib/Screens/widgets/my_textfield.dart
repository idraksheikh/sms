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
          }
          if (name == 'Password') {
            if (value!.isEmpty) {
              return 'Please enter $name.';
            }
            if (value.length < 5) {
              return 'Please enter valid $name.';
            }
          }
          if (name == "Name") {
            if (value!.isEmpty) {
              return 'Please enter $name.';
            }
            RegExp nameVal =
                RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");

            // Expected ouput: True
            if (!nameVal.hasMatch(value)) {
              return 'Please enter valid $name.';
            }
          }
          if (name == "Address") {
            if (value!.isEmpty) {
              return 'Please enter $name.';
            }
          }
          if (name == "Mobile") {
            if (value!.isEmpty) {
              return 'Please enter $name.';
            }
            if (value.length != 10) {
              return 'Please enter valid $name.';
            }
            RegExp mobVal =
                RegExp(r"^[0-9]");
            if (!mobVal.hasMatch(value)) {
              return 'Please enter valid $name.';
            }
          }
          if (name == "Standard") {
            if (value!.isEmpty) {
              return 'Please enter $name.';
            }
            if (value.length > 2) {
              return 'Please enter valid $name.';
            }
            RegExp classVal = RegExp(r"^([1-9]|1[012])$");
            if (!classVal.hasMatch(value)) {
              return 'Please enter valid $name.';
            }
          }
          if (name == "Year of joining") {
            if (value!.isEmpty) {
              return 'Please enter $name.';
            }
            if (value.length != 4) {
              return 'Please enter valid $name.';
            }
            RegExp yrVal = RegExp(r"\b(19[89][0-9]|20[0-4][0-9]|2050)\b");
            if (!yrVal.hasMatch(value)) {
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
          hintStyle: ThemeFontStyle(
            fontSize: 12,
            color: Colors.blueGrey.shade800,
          ).style,
        ),
        //TextStyle(color: Color.fromARGB(255, 14, 12, 12))),
      ),
    );
  }
}
