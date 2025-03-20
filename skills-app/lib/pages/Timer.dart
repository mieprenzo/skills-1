import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'Rating.dart';

class Timer extends StatelessWidget
{
  final Map<String, dynamic> message;
  final Map<String, dynamic> data;

  const Timer({super.key, required this.message, required this.data});

  @override
  Widget build(BuildContext context) {
    var timeLeft = message['minutes'] * 60;
    return
      Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0XFFFAF28C),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(

                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Oproep geaccepteerd',
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(24)),
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  child: DecoratedBox(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      border: Border.all(width: 1, color: Color(0XFF2AABE2))
                    ),
                    child: Center(
                      child: Text(message["answerText"]),
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(24)),
            Center(
              child: ElevatedButton(
                onPressed: () {Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => RatingPage(data: data)));},
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
            ),
          ],
        ),
      ));
  }
}