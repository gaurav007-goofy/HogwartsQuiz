import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);
  String get resultPharse {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are real..Harry Potter !';
    } else if (resultScore <= 12) {
      resultText = 'Why are you so intelligent..Hermione !';
    } else if (resultScore <= 16) {
      resultText = 'You are ... strange ..Ron ! ';
    } else {
      resultText = 'You are such a piece of shit..Draco !';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
              children: [
                Text(
                  resultPharse,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                    child: Text('Restart Quiz!'), onPressed: resetHandler)
              ],
            ),
          ),
        ),);
}
}
