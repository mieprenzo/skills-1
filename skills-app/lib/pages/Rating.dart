import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/textUtil.dart';

class RatingPage extends StatelessWidget {
  final Map<String, dynamic> data;

  const RatingPage({super.key, required this.data});
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
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.network(data['student']['foto']),
                  Padding(padding: EdgeInsets.all(12)),
                  BodyText(text: data['student']['naam'], fontSize: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
