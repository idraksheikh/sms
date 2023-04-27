import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:sms/Screens/home/assigments/add_class.dart';
import 'package:sms/Screens/styles/font.dart';
import 'package:sms/Screens/widgets/spacer.dart';


class AssignmentFolder extends StatefulWidget {
  const AssignmentFolder({Key? key}) : super(key: key);

  @override
  AssignmentFolderState createState() => AssignmentFolderState();
}

class AssignmentFolderState extends State<AssignmentFolder> {
  List<Map<String, dynamic>> pdfData = [];
  List classes = [];
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

  Future<String?> createClass(String name) async {
    final reference = FirebaseStorage.instance.ref().child(("Assignments/$name/.initialise"));
    final created = reference.putString('.initialise');
    await created.whenComplete(() => getAllDocuments());
    return null;
  }


  Future getAllDocuments() async {
    final results = await FirebaseStorage.instance.ref('Assignments').listAll();
    classes = results.prefixes;
    setState(() {});
  }

  @override
  void initState() {
    getAllDocuments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Classes", style: ThemeFontStyle(fontSize: 20, color: Colors.white).style,),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        elevation: 0.00,
        backgroundColor: const Color.fromARGB(255, 114, 203, 245),
      ),
      body: Column(
        children: [
          const Space(height: 10,),
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
                      className: classes[index].name,
                      heading: classes[index].name,
                    );
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
