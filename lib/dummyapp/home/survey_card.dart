import 'package:dummyapp/dummyapp/quiz/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SurveyCard extends StatelessWidget {
  const SurveyCard({
    Key? key,
    required this.title,
    required this.points,
    required this.cardicon,
  }) : super(key: key);

  final String title;
  final double points;
  final String cardicon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.push(
          context, MaterialPageRoute(builder: (context) => const QuizScreen())),
      child: Container(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(cardicon, height: 50, width: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Color(0xFF480c96),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(width: 60),
                      Text(
                        "${points.toInt()} Points",
                        style: const TextStyle(
                          color: Color(0xFF89789e),
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width - 120,
                    lineHeight: 8.0,
                    percent: points/100,
                    backgroundColor: const Color(0xFFebe8ed),
                    progressColor: const Color(0xFF480c96),
                  ),
                ],
              ),
            ],
          ),
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFfcfcfc),
              offset: Offset(10, 10),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Color(0xFFebebeb),
              offset: Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1,
            )
          ],
        ),
      ),
    );
  }
}
