import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class Timer extends StatelessWidget
{
  final Map<String, dynamic> data;

  const Timer({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var timeLeft = data['student']['minuten'] * 60;
    return
      Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => Timer(data: data)));},
          child: CircularCountDownTimer(
          duration: timeLeft,
          fillColor: Colors.white,
          ringColor: Colors.yellow,
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width / 1.5,
          strokeWidth: 4,
            isReverse: false,
              ),
        ),
      ));
  }
}