import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Timer.dart';

import '../components/textUtil.dart';

class AssignmentPage extends StatelessWidget {
  final Map<String, dynamic> data;
  String assignment = "";

  AssignmentPage({super.key, required this.data});

  void setAssignment(val)
  {
    this.assignment = val;
  }

  Future<dynamic> callStudent(context) async {
    var uri = Uri.https('mobileapp.canvasaccept.com', 'api/call-student');
    var response = await http.post(uri, body: {"studentId": "${data["student"]["id"]}", "assignmentText": assignment});
    print('response: ' + response.body);
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => Timer(data: data)));
  }

  @override
  Widget build(BuildContext context) {
    print(data);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6ECEF5),
        centerTitle: true,
        title: BodyText(text: 'Overzicht', fontSize: 16),
        titleTextStyle: TextStyle(color: Colors.white),
        leading: null,
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.network(data['student']['foto']),
                  Padding(padding: EdgeInsets.all(12)),
                  BodyText(text: data['student']['naam'], fontSize: 32),
                  Padding(padding: EdgeInsets.all(4)),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0XFFFAF28C),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        '${data['student']['minuten']} minuten lopen',
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(12)),
                  Row(children: [BodyText(text: 'OPDRACHT', fontSize: 12)]),
                  Padding(padding: EdgeInsets.all(4)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                    child: TextField(
                      maxLines: null,
                      onChanged: (val) => {},
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FilledButton(
                            onPressed: () => callStudent(context),
                            child: Text('Roep student op'),
                            style: ButtonStyle(
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                              ),
                              backgroundColor: WidgetStateProperty.all(
                                Color(0XFF2AABE2),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
