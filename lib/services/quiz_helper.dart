import 'package:quiz_flutter/utilities/constants.dart';
import 'network.dart';

class QuizHelper {
  Future<dynamic> getCategories() async {
    NetworkHelper networkHelper = NetworkHelper('$apiURL/categories/');

    var categories = await networkHelper.getData();
    return categories;
  }

  Future<dynamic> getQuestions(String category, int noOfQuestions) async {
    NetworkHelper networkHelper = NetworkHelper('$apiURL/questions/');

    var questions = await networkHelper.postData(category, noOfQuestions);
    return questions;
  }
}
