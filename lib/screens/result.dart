import 'package:flutter/material.dart';
import 'package:quiz_flutter/screens/quiz.dart';
import 'package:quiz_flutter/utilities/constants.dart';

class QuizResult extends StatelessWidget {
  QuizResult(this.questions, this.category, this.noOfQuestions, this.score);

  final questions;
  String category;
  int noOfQuestions;
  int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Congrats',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontSize: 40.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      'You have completed the\n$category Quiz',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    Text(
                      'Your Score'.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    Text(
                      '$score / $noOfQuestions',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontSize: 70.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Card(
                          color: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 10.0),
                            child: Text(
                              "Take New Quiz",
                              textAlign: TextAlign.center,
                              style: kNextButtonText,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Quiz(
                                  questions: questions,
                                  category: category,
                                  noOfQuestions: noOfQuestions),
                            ),
                          );
                        },
                        child: Card(
                          color: Colors.white10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 10.0),
                            child: Text(
                              "Take Quiz Again",
                              textAlign: TextAlign.center,
                              style: kNextButtonText,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
