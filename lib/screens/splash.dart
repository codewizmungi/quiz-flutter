import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quiz_flutter/screens/categories.dart';
import 'package:quiz_flutter/services/quiz_helper.dart';
import 'package:quiz_flutter/utilities/constants.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    getCategories();
  }

  void getCategories() async {
    var categories = await QuizHelper().getCategories();
    if (!context.mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Categories(categories: categories),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'General Quiz',
            style: kSplashScreenText,
          ),
          SizedBox(
            height: 10.0,
          ),
          SpinKitThreeBounce(
            color: Colors.white,
            size: 30.0,
          )
        ],
      ),
    );
  }
}
