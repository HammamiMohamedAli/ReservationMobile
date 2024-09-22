import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yallaplay_mobile/service/repositories/answer_repos.dart';
import 'package:yallaplay_mobile/service/repositories/question_repos.dart';
import 'package:yallaplay_mobile/model/question.dart';

final questionsViewModelProvider = Provider((ref) => QuestionViewModel());
final answersViewModelProvider = Provider((ref) => QuestionViewModel());

class QuestionViewModel {
  Future<List<Question>> fetchQuestion(WidgetRef ref) async {
    return await ref.read(questionsReposProvider).getQuestionList();
  }

  Map<int, int> _questionToAnswer = Map<int, int>();

  Map<int, int> get questionToAnswer {
    return _questionToAnswer;
  }

  void setSelectedAnswer(int answerId, int questionId) {
    _questionToAnswer[questionId] = answerId;
  }

  Future<bool> sendAnswers(WidgetRef ref, body) async {
    return await ref.read(answersReposProvider).SendAnswers(body);
  }
}
