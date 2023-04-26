import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:sms/Screens/home/assigments/add_class.dart';
import 'package:sms/Screens/styles/font.dart';
import 'package:sms/Screens/widgets/spacer.dart';


class AssignmentUpload extends StatefulWidget {
  const AssignmentUpload({Key? key}) : super(key: key);

  @override
  AssignmentUploadState createState() => AssignmentUploadState();
}

class AssignmentUploadState extends State<AssignmentUpload> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> pdfData = [];
  List classes = [];
  String className = 'Class I';
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
                className = value;
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
                createClass(_textFieldController.text);
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

  Future<String?> uploadPdf(String fileName, File file) async {
    final reference = FirebaseStorage.instance
        .ref()
        .child("Assignments/$className/$fileName.pdf");
    final uploadTask = reference.putFile(file);
    await uploadTask.whenComplete(() {});
    final downloadLink = await reference.getDownloadURL();
    await _firebaseFirestore.collection(className).add({
      "name": fileName,
      "url": downloadLink,
    });
    return null;
  }

  Future<String?> createClass(String name) async {
    final reference = FirebaseStorage.instance.ref().child(("Assignments/$name/.initialise"));
    final created = reference.putString('.initialise');
    await created.whenComplete(() => getAllDocuments());
    print(reference);
    return null;
  }

  FilePickerResult? result;
  PlatformFile? pickedfile;
  bool isLoading = false;
  File? fileToDisplay;

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      String fileName = result.files[0].name;
      File file = File(result.files[0].path!);
      uploadPdf(fileName, file);
    }
  }

  Future getAllPdf() async {
    final results = await _firebaseFirestore.collection(className).get();
    pdfData = results.docs.map((e) => e.data()).toList();
    setState(() {});
  }

  Future getAllDocuments() async {
    final results = await FirebaseStorage.instance.ref('Assignments').listAll();
    classes = results.prefixes;
    setState(() {});
  }

  @override
  void initState() {
    getAllPdf();
    getAllDocuments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assignment Upload"),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        elevation: 0.00,
        backgroundColor: const Color.fromARGB(255, 114, 203, 245),
      ),
      body: Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () {
                return getAllDocuments();
              },
              child: GridView.builder(
                  itemCount: classes.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return AddClass(
                      icon: Icons.folder_copy_outlined,
                      // url: pdfData[index]['url'],
                      heading: classes[index].name,
                    );
                    //  AssignmentCard(icon: Icons.picture_as_pdf_outlined, url: pdfData[index]['url'], heading: pdfData[index]['name'],)
                  }),
            ),
          ),
          const Divider(
            height: 5,
            thickness: 1,
          ),
          const Space(
            height: 20,
          ),
          Center(
            child: Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
              ),
              child: OutlinedButton(
                  onPressed: () {
                    _showMyDialog();
                  },
                  child: Text(
                    'Add Class',
                    style:
                        ThemeFontStyle(fontSize: 16, color: Colors.blue).style,
                  )),
            ),
          ),
          const Space(
            height: 20,
          ),
        ],
      ),
    );
  }
}
