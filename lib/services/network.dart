import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;
  static int totalCategories = 0;
  static int totalQuestions = 0;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var dataNodes = json.decode(response.body);
      totalCategories = dataNodes.length;
      return jsonDecode(response.body);
    } else {
      throw Exception('Could not fetch data!, status: ${response.statusCode}');
    }
  }

  Future postData(String category, int noOfQuestions) async {
    http.Response response = await http.post(
      Uri.parse(url),
      body: {
        "category": category,
        "no_of_questions": noOfQuestions.toString(),
      },
    );

    if (response.statusCode == 200) {
      var dataNodes = json.decode(response.body);
      totalQuestions = dataNodes.length;
      return jsonDecode(response.body);
    } else {
      throw Exception('Could not fetch data!, status: ${response.statusCode}');
    }
  }
}
