import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite spell ?',
      'answers': [
        {'text': 'Expelliarmus', 'score': 5},
        {'text': 'Alohomora', 'score': 1},
        {'text': 'Expecto patronum', 'score': 10},
        {'text': 'Wingardium leviosa', 'score': 3}
      ]
    },
    {
      'questionText': 'Which house do you wanna be in ?',
      'answers': [
        {'text': 'Slytherin', 'score': 10},
        {'text': 'Gryffindor', 'score': 1},
        {'text': 'Ravenclaw', 'score': 5},
        {'text': 'Hufflepuff', 'score': 3}
      ]
    },
    {
      'questionText': 'Who is your favourite professor ?',
      'answers': [
        {'text': 'Professor Snape', 'score': 10},
        {'text': 'Professor McGonagall', 'score': 1},
        {'text': 'Professor Lupin', 'score': 5},
        {'text': 'Professor Sprout', 'score': 3}
      ]
    }
  ];
  var _questionindex = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionindex = 0;
      _totalScore = 0;
    });
  }

  void _answerchosen(int score) {
    _totalScore += score;
    setState(() {
      _questionindex += 1;
    });
    print(_questionindex);
    if (_questionindex < _questions.length) {
      print('we have more questions !');
    } else {
      print('no more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(300),
          child: AppBar(
            title: Text(
              'Hogwarts Quiz ',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            backgroundColor: Colors.blue,
            centerTitle: true,
            flexibleSpace: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50)),
              child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/hogwarts.jpg'),
                          fit: BoxFit.fill))),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50)),
            ),
          ),
        ),
        body: _questionindex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionindex,
                answerQuestion: _answerchosen)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
