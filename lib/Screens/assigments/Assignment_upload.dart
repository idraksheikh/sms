import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
// import 'package:modernlogintute/Screens/login_page.dart';

class AssignmentUpload extends StatefulWidget {
  const AssignmentUpload({Key? key}) : super(key: key);

  @override
  AssignmentUploadState createState() => AssignmentUploadState();
}

class AssignmentUploadState extends State<AssignmentUpload> {
  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedfile;
  bool isLoading = false;
  File? fileToDisplay;

  void pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });

      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );

      if (result != null) {
        _fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        fileToDisplay = File(pickedfile!.path.toString());

        print('File name $_fileName');
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
                Navigator.pushReplacementNamed(context, '/home');
                print("pressed");
              },
              child: Text('Submit')),
        ],
      ),
    );
  }
}
