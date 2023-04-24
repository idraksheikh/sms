import 'package:flutter/material.dart';
import 'package:sms/Screens/home/assigments/pdf_viewer.dart';
import 'package:sms/Screens/styles/font.dart';

class AssignmentCard extends StatelessWidget {
  final IconData icon;
  final String heading;
  final String url;

  const AssignmentCard({Key? key,
    required this.icon,
    required this.url,
    this.heading = 'Heading',
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => PdfViewer(pdfUrl: url)));
      },
      // overlayColor: MaterialStateProperty.all(Colors.cyan),
      focusColor: Colors.white,
      borderRadius: BorderRadius.circular(24),
      splashColor: Colors.white,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.25,
          width: MediaQuery
              .of(context)
              .size
              .width * 0.42,
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
