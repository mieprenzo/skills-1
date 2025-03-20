import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:skillsapp/components/textUtil.dart';
import 'package:http/http.dart' as http;
import 'package:skillsapp/pages/AssignmentPage.dart';
import 'package:skillsapp/pages/LoadingPage.dart';

class SelectCompetition extends StatelessWidget {
  Future<dynamic> searchStudent(context) async {
    var uri = Uri.https('mobileapp.canvasaccept.com', 'api/search-student');
    var response = await http.post(uri, body: {"competitionNumber": "4.5"});
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => AssignmentPage(data: jsonDecode(response.body))));
  }

  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: Container(
              child: Image.asset(
                'images/plattegrond.PNG',
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.fitHeight,
                scale: 2,
              ),
            ),
          ),
          DropdownButtonFormField(
            value: null,
            items: [
              DropdownMenuItem(child: Text('Mobile app developer')),
            ],
            onChanged: (val) => {searchStudent(context)},
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FilledButton(
                    onPressed: () async {
                      FutureBuilder(
                        future: searchStudent(context),
                        builder: (context, snapshot) {
                          return new Center(child: CircularProgressIndicator(),);
                        },
                      );
                    },
                    child: Text('Zoek een student'),
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                      ),
                      backgroundColor: WidgetStateProperty.all(
                        Color(0XFF6ECEF5),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(20)),
        ],
      ),
    );
  }
}
