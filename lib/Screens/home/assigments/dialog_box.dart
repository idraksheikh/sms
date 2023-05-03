import 'package:flutter/material.dart';

import '../../styles/font.dart';

class DialogBox extends StatefulWidget {
  const DialogBox({Key? key}) : super(key: key);

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {

  final TextEditingController _textFieldController = TextEditingController();

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Enter the Class',
            style: ThemeFontStyle(fontSize: 18).style,
          ),
          content: TextField(
            onChanged: (value) {
              setState(() {
// className = value;
              });
            },
            controller: _textFieldController,
            decoration: InputDecoration(
                hintText: "Eg. Class I",
                hintStyle:
                    ThemeFontStyle(fontSize: 14, fontWeight: FontWeight.normal)
                        .style),
          ),
          actions: <Widget>[
            OutlinedButton(
              child: Text(
                'Cancel',
                style: ThemeFontStyle(fontSize: 14, color: Colors.blue).style,
              ),
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
            ),
            OutlinedButton(
              child: Text(
                'Create',
                style: ThemeFontStyle(fontSize: 14, color: Colors.blue).style,
              ),
              onPressed: () {
                // createClass(_textFieldController.text);
                setState(() {
                  Navigator.pop(context);
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OutlinedButton(
          onPressed: () {
            _showMyDialog();
          },
          child: Text(
            'Add Class',
            style:
            ThemeFontStyle(fontSize: 16, color: Colors.blue).style,
          )),
    );
  }
}
