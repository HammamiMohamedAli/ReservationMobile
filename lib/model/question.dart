class Question {
  final int id;
  final String content;
  final List<Answer> answers;

  Question({
    required this.id,
    required this.content,
    required this.answers,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    List<dynamic> answersJson = json['answers'] ?? [];
    List<Answer> answers =
        answersJson.map((answer) => Answer.fromJson(answer)).toList();

    return Question(
      id: json['id'],
      content: json['content'],
      answers: answers,
    );
  }
}

class Answer {
  final int id;
  final String content;

  Answer({
    required this.id,
    required this.content,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      id: json['id'],
      content: json['content'],
    );
  }
}