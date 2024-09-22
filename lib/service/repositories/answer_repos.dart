import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yallaplay_mobile/service/api_base_helper.dart';
import '../endpoints.dart' as end_points;
import 'dart:convert';

final answersReposProvider = Provider((ref) => AnswerRepos());

class AnswerRepos {
  // ignore: non_constant_identifier_names
  Future<bool> SendAnswers(body) async {
    ApiBaseHelper helper = ApiBaseHelper();
    final response = await helper.post(end_points.RESULT_ANSWER, body,
        needsAuth: true, showLoader: true);
    Map<String, dynamic> result = json.decode(response.body.toString());
    bool success = result["success"];
    if (success == true) {
      return true;
    } else {
      return false;
    }
  }
}
