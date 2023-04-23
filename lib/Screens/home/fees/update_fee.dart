import 'package:flutter/material.dart';

import '../../styles/font.dart';
import '../../widgets/spacer.dart';


class UploadFee extends StatelessWidget {
  const UploadFee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Fees'),
      ),
      body: Column(
        children: [
          const Space(
            height: 20,
          ),
          Center(
              child: Text(
            'List of Students',
            style: ThemeFontStyle(fontSize: 30).style,
          )),
          // Cards for student name
          const Space(height: 10),
          const Divider(
            height: 5,
          ),
          const Space(height: 10),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                    return  Card(
                      elevation: 3,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [Text('Student Name'), Text('Fees Paid')],
                        ),
                      ),
                    );
                }),
          ),
        ],
      ),
    );
  }
}
