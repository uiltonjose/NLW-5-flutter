import 'package:flutter/foundation.dart';

class ChallengeController {
  final currentPageNotifier = ValueNotifier<int>(1);
  int get currentPage => currentPageNotifier.value;
  set currentPage(int page) => currentPageNotifier.value = page;

  int countCorrectAnswers = 0;
}
