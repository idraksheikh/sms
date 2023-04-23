import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

// final storageRef = FirebaseStorage.instance.ref();
// final mountainsRef = storageRef.child("mountains.jpg");

class AssignmentUpload extends StatefulWidget {
  const AssignmentUpload({Key? key}) : super(key: key);

  @override
  AssignmentUploadState createState() => AssignmentUploadState();
}

class AssignmentUploadState extends State<AssignmentUpload> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<String?> uploadPdf(String fileName, File file) async {
    final reference =
        FirebaseStorage.instance.ref().child("assignments/$fileName.pdf");

    final uploadTask = reference.putFile(file);

    await uploadTask.whenComplete(() {});

    final downloadLink = await reference.getDownloadURL();

    return downloadLink;
  }

  FilePickerResult? result;
  PlatformFile? pickedfile;
  bool isLoading = false;
  File? fileToDisplay;

  void pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });

      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: false,
      );

      if (result != null) {
        String fileName = result.files[0].name;
        File file = File(result.files[0].path!);
        pickedfile = result.files.first;
        fileToDisplay = File(pickedfile!.path.toString());
        final downloadLink = uploadPdf(fileName, file);
        await _firebaseFirestore.collection("assignments").add({
          "name": fileName,
          "url": downloadLink,
        });

        print("PDF uploaded succesfully");
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50)),
        ),
        elevation: 0.00,
        backgroundColor: const Color.fromARGB(255, 114, 203, 245),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: isLoading
                ? const CircularProgressIndicator()
                : TextButton(
                    onPressed: () {
                      pickFile();
                    },
                    child: const Text('Pick File')),
          ),
          if (pickedfile != null)
            SizedBox(
                height: 500, width: 400, child: Image.file(fileToDisplay!)),
          ElevatedButton(
              // style:ButtonStyle(backgroundColor: MaterialStateProperty(Colors.accents),),
              onPressed: () {
                // Navigator.pushReplacementNamed(context, '/home');
                pickFile();
              },
              child: Text('Submit')),
        ],
      ),
    );
  }
}
