import 'package:flutter/material.dart';
import 'package:sms/Screens/home/assigments/assignment_upload.dart';
import 'package:sms/Screens/styles/font.dart';

class AddClass extends StatelessWidget {
  final IconData icon;
  final String heading;
  final String className;

  const AddClass({
    Key? key,
    required this.icon,
    this.heading = 'Heading',
    required this.className,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AssignmentUpload(classes: className,)));
      //    PdfViewer(pdfUrl: url)
      },
      // overlayColor: MaterialStateProperty.all(Colors.cyan),
      focusColor: Colors.white,
      borderRadius: BorderRadius.circular(24),
      splashColor: Colors.white,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width * 0.42,
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            // gradient: RadialGradient(colors: const [Colors.transparent, Colors.purpleAccent]),
          ),
          child: Column(
            children: [
              Expanded(
                  child: Icon(
                icon,
                size: 100,
              )),
              Text(heading, style: ThemeFontStyle(fontSize: 12).style),
              // Text(subHeading),
            ],
          ),
        ),
      ),
    );
  }
}
