import 'package:flutter/material.dart';

const apiURL = 'https://trybalsolutions.com/api/quiz';

const kSplashScreenText = TextStyle(
  fontSize: 28.0,
  fontFamily: 'Montserrat',
  fontStyle: FontStyle.italic,
  fontWeight: FontWeight.w500,
);

const kCategoryHeaderText = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w600,
);

const kOptionsButtonText = TextStyle(
  color: Colors.black,
  fontFamily: 'Montserrat',
  fontSize: 15.0,
);

const kNextButtonText = TextStyle(
  color: Colors.white,
  fontFamily: 'Montserrat',
  fontSize: 15.0,
);

const kQuestionText = TextStyle(
  color: Colors.white,
  fontFamily: 'Montserrat',
  fontSize: 20.0,
);

const kQuizTitleText = TextStyle(
  color: Colors.white,
  fontFamily: 'Montserrat',
  fontSize: 15.0,
);

const kOptionsButtonStyle =
    ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.white));

const kNextButtonStyle =
    ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue));
