import 'package:flutter/material.dart';
import 'package:lab6/quizbrain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const QuizzPage());
}

class QuizzPage extends StatelessWidget {
  const QuizzPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: const SafeArea(child: Quizzler()),
      ),
    );
  }
}

class Quizzler extends StatefulWidget {
  const Quizzler({super.key});

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Icon> scoreKeeper = [];
  int score = 0;

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizBrain.getAns();

    setState(() {
      if (userAnswer == correctAnswer) {
        scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
        score++;
      } else {
        scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
      }
    });


    if (quizBrain.isFinished()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.grey[900],
          title: const Text(
            "SCOREBOARD",
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            "You Scored $score out of ${quizBrain.totalQuestions}",
            style: const TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  quizBrain.reset();
                  scoreKeeper.clear();
                  score = 0;
                });
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
    } else {
      quizBrain.nextQuestion();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quizBrain.getQuestionText(),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),

        // TRUE BUTTON
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () => checkAnswer(true),
              child: const Text("True", style: TextStyle(color: Colors.white)),
            ),
          ),
        ),

        // FALSE BUTTON
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => checkAnswer(false),
              child: const Text("False", style: TextStyle(color: Colors.white)),
            ),
          ),
        ),

        // SCORE ICONS
        Row(children: scoreKeeper),
      ],
    );
  }
}
