import 'package:flutter/material.dart';
import 'package:sms/Screens/widgets/calendar.dart';
import 'package:sms/Screens/widgets/text_box.dart';

class EntryForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  EntryForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Entry Form',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        // mainAxisSize: MainAxisSize.max,
        children: [
          const Divider(
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(28),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  const TextBox(
                      name: 'Enrollment Number',
                      message: 'Enter the enrollment number'),
                  const TextBox(
                      name: 'Student Name',
                      message: 'Enter the Student Name'),
                  const TextBox(name: 'Father\'s Name'),
                  const TextBox(name: 'Age'),
                  const TextBox(name: 'Class'),
                  const TextBox(
                    name: 'Contact Number',
                    message: 'Enter a valid number',
                  ),
                  const CalendarBox(name: 'DOB'),
                  ElevatedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState!.validate()) {
                        // Process data.
                      }
                    },
                    child: const Text('Submit'),
                  ),

                ],
              ),
              ),
          ),
        ],
      ),
    );
  }
}
