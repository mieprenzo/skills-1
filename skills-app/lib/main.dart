import 'package:flutter/material.dart';
import 'package:skillsapp/pages/register.dart';

import 'components/textUtil.dart';
int page = 0;
void main() {

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  Future<Map<String, String>> getStudents() async {
    return {};
  }

  void SubmitRegister() {

  }

  @override
  Widget build(BuildContext context) {

    List pages = [RegisterPage()];

    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        inputDecorationTheme: InputDecorationTheme(enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Color(0XFF2AABE2))
        ))
      ),
      home: RegisterPage()
    );
  }
}

