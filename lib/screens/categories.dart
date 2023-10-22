import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quiz_flutter/screens/quiz.dart';
import 'package:quiz_flutter/services/network.dart';
import 'package:quiz_flutter/utilities/constants.dart';
import '../services/quiz_helper.dart';

class Categories extends StatefulWidget {
  Categories({this.categories});

  final categories;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<Widget> categoriesList = [];
  List<Color> categoryColors = [
    Colors.blueGrey,
    Colors.orange,
    Colors.redAccent,
    Colors.lightGreen,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.blue
  ];

  @override
  void initState() {
    super.initState();
    getCategories(widget.categories);
  }

  void getCategories(dynamic categories) {
    for (int i = 0; i < NetworkHelper.totalCategories; i++) {
      categoriesList.add(CategoryCard(
          categories[i]['category'], categoryColors[Random().nextInt(7)]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60.0,
                ),
                const Text(
                  'Pick a\nCategory',
                  style: kCategoryHeaderText,
                ),
                const SizedBox(
                  height: 60.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: categoriesList,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  CategoryCard(this.category, this.color);

  final String category;
  final Color color;
  bool isOptionClickable = true;

  Future getQuestions(
      BuildContext context, String category, int noOfQuestions) async {
    var questions = await QuizHelper().getQuestions(category, noOfQuestions);
    if (!context.mounted) return;
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Quiz(
          questions: questions,
          category: category,
          noOfQuestions: noOfQuestions,
        ),
      ),
    );
    isOptionClickable = true;
  }

  void showMyDialog(BuildContext context) {
    //Creating an Dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Select an Option',
            style: TextStyle(fontSize: 15.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  if (isOptionClickable == true) {
                    getQuestions(context, category, 5);
                    isOptionClickable = false;
                  }
                },
                child: Card(
                  color: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      '5 Questions',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (isOptionClickable == true) {
                    getQuestions(context, category, 10);
                    isOptionClickable = false;
                  }
                },
                child: Card(
                  color: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      '10 Questions',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showMyDialog(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: Card(
          color: color,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 28.0),
            child: Text(
              category,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
