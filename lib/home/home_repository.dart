import 'dart:convert';

import 'package:devquiz/shared/models/quiz.dart';
import 'package:devquiz/shared/models/user.dart';
import 'package:flutter/services.dart';

class HomeRepository {
  Future<User> getUser() async {
    final response = await rootBundle.loadString("assets/database/user.json");
    return User.fromJson(response);
  }

  Future<List<Quiz>> getQuizzes() async {
    final response =
        await rootBundle.loadString("assets/database/quizzes.json");
    final list = jsonDecode(response) as List;
    final quizzes = list.map((e) => Quiz.fromJson(e)).toList();
    return quizzes;
  }
}
