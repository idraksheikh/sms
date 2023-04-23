import 'package:flutter/material.dart';

import '../../styles/font.dart';


class Total extends StatelessWidget {
  final int days;
  final String heading;
  final Color colors;

  const Total(
      {Key? key,
      this.days = 20,
      this.heading = 'Heading',
      required this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width * 0.42,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24), color: colors),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30, top: 5),
              child: Text(
                heading,
                style:
                    ThemeFontStyle(fontSize: 20, color: Colors.white).style,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                '$days',
                style: ThemeFontStyle(
                        fontSize: 100, color: Colors.white, height: 0.01)
                    .style,
              ),
              // Text(subHeading),
            ),
          ],
        ),
      ),
    );
  }
}
