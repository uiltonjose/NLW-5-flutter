import 'dart:convert';

class Answer {
  final String title;
  final bool isCorrect;

  Answer({
    required this.title,
    this.isCorrect = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isCorrect': isCorrect,
    };
  }

  factory Answer.fromMap(Map<String, dynamic> map) {
    return Answer(
      title: map['title'],
      isCorrect: map['isCorrect'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Answer.fromJson(String source) => Answer.fromMap(json.decode(source));
}
