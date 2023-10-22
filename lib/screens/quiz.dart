import 'package:flutter/material.dart';
import 'package:quiz_flutter/screens/result.dart';
import 'package:quiz_flutter/utilities/constants.dart';
import '../services/question.dart';

class Quiz extends StatefulWidget {
  Quiz({required this.questions,
    required this.category,
    required this.noOfQuestions});

  final questions;
  final String category;
  final int noOfQuestions;

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int _questionNumber = 0;
  int scoreKeeper = 0;
  final List<Question> _questionList = [];
  String nextString = "Next";
  Color nextCardColor = Colors.grey;
  Color optionACardColor = Colors.white;
  Color optionBCardColor = Colors.white;
  Color optionCCardColor = Colors.white;
  bool isOptionClickable = true;
  bool isNextClickable = false;

  @override
  void initState() {
    super.initState();
    getQuestions();
  }

  void getQuestions() async {
    try {
      var questions = widget.questions;
      for (int i = 0; i < widget.noOfQuestions; i++) {
        _questionList.add(Question(
          questions[i]['question'],
          questions[i]['option_a'],
          questions[i]['option_b'],
          questions[i]['option_c'],
          questions[i]['correct_answer'],
        ));
      }
    } catch (e) {
      _questionList.add(Question(
        'Question Here',
        'Option A',
        'Option B',
        'Option C',
        'Option A',
      ));
      print(e);
    }
  }

  void nextQuestion() {
    if (nextString == 'Next') {
      if (_questionNumber < widget.noOfQuestions - 1) {
        optionACardColor = Colors.white;
        optionBCardColor = Colors.white;
        optionCCardColor = Colors.white;
        isOptionClickable = true;
        isNextClickable = false;
        _questionNumber++;
      }
      if (_questionNumber == widget.noOfQuestions - 1) {
        setState(() {
          nextCardColor = Colors.deepOrangeAccent;
          nextString = 'View Result';
        });
      }
    } else if (nextString == 'View Result') {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              QuizResult(widget.questions, widget.category,
                  widget.noOfQuestions, scoreKeeper),
        ),
      );
    }
  }

  String getQuestionText() {
    return _questionList[_questionNumber].questionText;
  }

  String getOptionA() {
    return _questionList[_questionNumber].optionA;
  }

  String getOptionB() {
    return _questionList[_questionNumber].optionB;
  }

  String getOptionC() {
    return _questionList[_questionNumber].optionC;
  }

  String getCorrectAnswer() {
    return _questionList[_questionNumber].correctAnswer;
  }

  void checkAnswer(String userSelectedAnswer) {
    String correctAnswer = getCorrectAnswer();
    String optionA = getOptionA();
    String optionB = getOptionB();
    String optionC = getOptionC();
    setState(() {
      if (correctAnswer == userSelectedAnswer) {
        scoreKeeper++;
        if (correctAnswer == optionA) {
          optionACardColor = Colors.green;
        }
        if (correctAnswer == optionB) {
          optionBCardColor = Colors.green;
        }
        if (correctAnswer == optionC) {
          optionCCardColor = Colors.green;
        }
      } else {
        if (correctAnswer == optionA) {
          optionACardColor = Colors.green;
        } else if (userSelectedAnswer == optionA) {
          optionACardColor = Colors.redAccent;
        }
        if (correctAnswer == optionB) {
          optionBCardColor = Colors.green;
        } else if (userSelectedAnswer == optionB) {
          optionBCardColor = Colors.redAccent;
        }
        if (correctAnswer == optionC) {
          optionCCardColor = Colors.green;
        } else if (userSelectedAnswer == optionC) {
          optionCCardColor = Colors.redAccent;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.category} Quiz',
          style: kQuizTitleText,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Question ${_questionNumber + 1} / ${widget.noOfQuestions}',
                  style: kQuizTitleText,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 80.0, horizontal: 20.0),
                      child: Text(
                        getQuestionText(),
                        textAlign: TextAlign.center,
                        style: kQuestionText,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          if (isOptionClickable == true) {
                            checkAnswer(getOptionA());
                            isOptionClickable = false;
                            isNextClickable = true;
                          }
                        },
                        child: Card(
                          color: optionACardColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 10.0),
                            child: Text(
                              getOptionA(),
                              textAlign: TextAlign.center,
                              style: kOptionsButtonText,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          if (isOptionClickable == true) {
                            checkAnswer(getOptionB());
                            isOptionClickable = false;
                            isNextClickable = true;
                          }
                        },
                        child: Card(
                          color: optionBCardColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 10.0),
                            child: Text(
                              getOptionB(),
                              textAlign: TextAlign.center,
                              style: kOptionsButtonText,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          if (isOptionClickable == true) {
                            checkAnswer(getOptionC());
                            isOptionClickable = false;
                            isNextClickable = true;
                          }
                        },
                        child: Card(
                          color: optionCCardColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 10.0),
                            child: Text(
                              getOptionC(),
                              textAlign: TextAlign.center,
                              style: kOptionsButtonText,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30.0, horizontal: 5.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isNextClickable == true) {
                              nextQuestion();
                              isOptionClickable = true;
                              isNextClickable = false;
                            }
                          });
                        },
                        child: Card(
                          color: nextCardColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 10.0),
                            child: Text(
                              nextString,
                              textAlign: TextAlign.center,
                              style: kNextButtonText,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
