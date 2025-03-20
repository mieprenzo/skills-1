import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:skillsapp/main.dart';
import 'package:skillsapp/pages/selectCompetition.dart';

import '../components/textUtil.dart';

class RegisterPage extends StatelessWidget {
  String? name;
  String? competition;

  void setName(value) {
    this.name = value;
  }

  void setCompetition(value) {
    this.competition = value;
  }

  void SubmitForm(context) {
    if (name != "") {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => SelectCompetition()));
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(height: height / 8),
            Center(
              child: Column(
                children: [
                  Image.asset('images/logos/SH_logo_S.png'),
                  Padding(padding: EdgeInsets.all(32)),
                  Column(
                    children: [
                      Row(children: [HeaderText(text: 'AANMELDEN')]),
                      Row(
                        children: [
                          Flexible(
                            child: BodyText(
                              text:
                                  'Meld je aan om studenten te kunnen oproepen voor assistentie bij jouw vakwedstrijd.',
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 32,
                            height: 42,
                            child: TextField(
                              onChanged: (val) => setName(val),
                              decoration: InputDecoration(),
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ],
                      ),
                      // Row(
                      //   children: [
                      //     SizedBox(
                      //       width: 42,
                      //       height: 42,
                      //       child: DropdownButton(
                      //         items: [
                      //           DropdownMenuItem(
                      //             child: Text('Mobile App Development'),
                      //           ),
                      //           DropdownMenuItem(
                      //             child: Text('Web development'),
                      //           ),
                      //         ],
                      //         onChanged: (index) => setCompetition(index),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FilledButton(
                                onPressed: () => SubmitForm(context),
                                child: Text('Aanmelden'),
                                style: ButtonStyle(
                                  shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4)))),
                                  backgroundColor: WidgetStateProperty.all(Color(0XFF6ECEF5)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
