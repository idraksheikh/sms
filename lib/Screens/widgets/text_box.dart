import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final String name;
  final String message;
  const TextBox({Key? key, required this.name, this.message = 'Enter a value'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: name,
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return message;
        }
        return null;
      },
    );
  }
}
