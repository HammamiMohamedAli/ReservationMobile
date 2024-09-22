import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yallaplay_mobile/model/question.dart';
import 'package:yallaplay_mobile/service/api_base_helper.dart';
import '../endpoints.dart' as end_points;

final questionsReposProvider = Provider((ref) => QuestionsRepos());

class QuestionsRepos {
  Future<List<Question>> getQuestionList() async {
    ApiBaseHelper helper = ApiBaseHelper();
    final response = await helper.get(end_points.Get_QUESTIONS,
        showLoader: true, needsAuth: true);

    if (response.statusCode == 200) {
      List listQuestion = json.decode(response.body)['data'] as List;

      return listQuestion.map((e) => Question.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
