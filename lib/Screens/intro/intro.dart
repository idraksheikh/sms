import 'package:flutter/material.dart';
import 'package:sms/Screens/styles/font.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Image.asset('assets/images/phone.jpg'),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(253, 252, 253, 1),
                image: DecorationImage(
                  image: AssetImage('assets/images/book.gif'),
                ),
              ),
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Image.asset('assets/images/intro.jpg', fit: BoxFit.fitHeight),
                  Card(
                    elevation: 3,
                    margin: const EdgeInsets.all(24),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          Color.fromRGBO(93, 122, 242, 1),
                          Color.fromRGBO(105, 127, 245, 0.9),
                          Color.fromRGBO(105, 129, 244, 0.8),
                        ]),

                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Welcome to SMS',
                                style: ThemeFontStyle(
                                        fontSize: 34, color: Colors.black)
                                    .style,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'School Management System',
                                style: ThemeFontStyle(fontSize: 15).style,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              OutlinedButton(
                                style: ButtonStyle(
                                  // shadowColor: MaterialStateProperty.all(Colors.brown),
                                  elevation: MaterialStateProperty.all(0.3),
                                  backgroundColor:
                                      MaterialStateProperty.all(const Color.fromRGBO(253, 252, 253, 1),),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/login');
                                },
                                child: Text(
                                  'Getting Started',
                                  style: ThemeFontStyle(
                                          fontSize: 15, color: Colors.black)
                                      .style,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
