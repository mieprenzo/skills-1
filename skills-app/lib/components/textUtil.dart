
import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;
  const HeaderText({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    print(text);
    return Text(text, style: TextStyle(fontFamily: 'bebasNeue', fontSize: 32));
  }
}

class BodyText extends StatelessWidget {
  final String text;
  final double fontSize;
  const BodyText({super.key, required this.text, required this.fontSize});
  @override
  Widget build(BuildContext context) {
    print(text);
    return Text(
      text,
      style: TextStyle(fontFamily: 'frutiger', fontSize: fontSize),
    );
  }
}