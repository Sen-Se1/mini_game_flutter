import 'package:flutter/material.dart';
import 'package:quiz/presentation/result/pages/result.dart';

import '../../../common/widgets/appbar/appbar.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  final List<Map<String, Object>> _questions = [
    {
      'question': "What's your favorite color?",
      'options': ['Black', 'Red', 'Green'],
      'answer': 0,
    },
    {
      'question': "What's your favorite animal?",
      'options': ['Cat', 'Dog', 'Bird'],
      'answer': 1,
    },
    {
      'question': "What's your favorite season?",
      'options': ['Winter', 'Spring', 'Summer'],
      'answer': 2,
    }
  ];

  void _nextQuestion(int selectedOption) {
    if (selectedOption == _questions[_currentQuestionIndex]['answer']) {
      _score++;
    }

    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultPage(score: _score)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text(
          "Game Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white70,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Question N°${_currentQuestionIndex + 1}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const SizedBox(height: 200),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _questions[_currentQuestionIndex]['question'] as String,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: (_questions[_currentQuestionIndex]['options'] as List<String>)
                      .asMap()
                      .entries
                      .map((option) {
                    return TextButton(
                      onPressed: () => _nextQuestion(option.key),
                      child: Text(option.value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
