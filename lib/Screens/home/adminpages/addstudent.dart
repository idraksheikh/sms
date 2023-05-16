import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:intl/intl.dart';
import 'package:sms/Services/admin.dart';
import '../../styles/font.dart';
import '../../styles/font_param.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_textfield.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  // text editing controllers
  final _formkey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final registration_idController = TextEditingController();
  final addressController = TextEditingController();
  final mobileController = TextEditingController();
  final standardController = TextEditingController();
  final yearofjoiningController = TextEditingController();
  final dobController = TextEditingController();
  final passwordController = TextEditingController();
  void addStudent(context) async {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      if (registration_idController.text.startsWith("ST")) {
        if (dobController.text.isNotEmpty) {
          await AdminManagement().addStudent(registration_idController.text, usernameController.text, addressController.text, mobileController.text, standardController.text, yearofjoiningController.text, dobController.text, passwordController.text);
        } else {
          Fluttertoast.showToast(
              msg: "Please Select valid dob",
              backgroundColor: Colors.red.shade300);
        }
      } else {
        Fluttertoast.showToast(
            msg: "Enter Valid Registration Id for Student",
            backgroundColor: Colors.red.shade300);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
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
                      color: Color.fromRGBO(30, 166, 198, 1),
                      image: AssetImage('assets/images/leftarrow.png'),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 40),
                  child: Text(
                    'Add Student',
                    style: ThemeFontStyle(
                            fontSize: 22,
                            color: const Color.fromRGBO(30, 166, 198, 1))
                        .style,
                  ),
                ),
                const Text(''),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Form(
              key: _formkey,
              child: Expanded(
                child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // username textfield
                    MyTextField(
                        controller: registration_idController,
                        hintText: 'Registration Id',
                        obscureText: false,
                        name: 'Registration Id'),

                    const SizedBox(height: 10),

                    // password textfield
                    MyTextField(
                      controller: usernameController,
                      hintText: 'Name',
                      obscureText: false,
                      name: 'Name',
                    ),

                    const SizedBox(height: 10),

                    // username textfield
                    MyTextField(
                        controller: addressController,
                        hintText: 'Address',
                        obscureText: false,
                        name: 'Address'),

                    const SizedBox(height: 10),

                    // password textfield
                    MyTextField(
                      controller: mobileController,
                      hintText: 'Mobile',
                      obscureText: false,
                      name: 'Mobile',
                    ),

                    const SizedBox(height: 10),
                    // username textfield
                    MyTextField(
                        controller: standardController,
                        hintText: 'Standard',
                        obscureText: false,
                        name: 'Standard'),

                    const SizedBox(height: 10),

                    // password textfield
                    MyTextField(
                      controller: yearofjoiningController,
                      hintText: 'Year of joining',
                      obscureText: false,
                      name: 'Year of joining',
                    ),

                    const SizedBox(height: 10),
                    // username textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                        controller: dobController,
                        //editing controller of this TextField
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          icon: const Icon(
                            Icons.calendar_today,
                            color: Color.fromRGBO(30, 166, 198, 1),
                          ), //icon of text field
                          labelText: "Enter Date", //label text of field
                          labelStyle: TextStyle(
                            color: Colors.blueGrey.shade800,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                        ),

                        readOnly: true,
                        //set it true, so that user will not able to edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now().subtract(const Duration(
                                days: 10 * 365,
                                hours: 0,
                                minutes: 0,
                                seconds: 0)),
                            firstDate: DateTime.now().subtract(const Duration(
                                days: 25 * 365,
                                hours: 0,
                                minutes: 0,
                                seconds: 0)),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime.now().subtract(const Duration(
                                days: 3 * 365,
                                hours: 0,
                                minutes: 0,
                                seconds: 0)),
                          );

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            setState(() {
                              dobController.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {}
                        },
                      ),
                    ),
                    const SizedBox(height: 10),

                    // password textfield
                    MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                      name: 'Password',
                    ),

                    const SizedBox(height: 15),

                    // sign in button
                    MyButton(
                      text: "Submit",
                      onTap: () {
                        addStudent(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
