import 'dart:convert';

import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_mode.dart';
import 'package:flutter/services.dart';

class HomeRepository {
  Future<UserModel> getUser() async {
    final respose = await rootBundle.loadString("database/user.json");

    return UserModel.fromJson(respose);
  }

  Future<List<QuizModel>> getQuizzes() async {
    final respose = await rootBundle.loadString("database/quizzes.json");
    final list = jsonDecode(respose) as List;
    return list.map((e) => QuizModel.fromMap(e)).toList();
  }
}
