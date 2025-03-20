import 'package:flutter/material.dart';

import '../components/textUtil.dart';

class AssignmentPage extends StatelessWidget {
  final Map<String, dynamic> data;

  const AssignmentPage({super.key, required this.data});

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
            child: Column(
              children: [
                Image.network(data['student']['foto']),
                Padding(padding: EdgeInsets.all(12)),
                BodyText(text: data['student']['naam'], fontSize: 32),
                Padding(padding: EdgeInsets.all(10)),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0XFFFAF28C),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Text('${data['student']['minuten']} minuten lopen'),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 8, child: TextField(maxLines: null, keyboardType: TextInputType.multiline,)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
