import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/app_text_styles.dart';

class QuizWidgets extends StatelessWidget {
  final String title;

  const QuizWidgets({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          AnswerWidget(
              title:
                  'Possibilita a criação de aplicativos compilados nativamente',
              isCorrect: true,
              isSelected: true),
          AnswerWidget(
              title:
                  'Possibilita a criação de aplicativos compilados nativamente',
              isCorrect: false,
              isSelected: true),
          AnswerWidget(
              title:
                  'Possibilita a criação de aplicativos compilados nativamente'),
          AnswerWidget(
              title:
                  'Possibilita a criação de aplicativos compilados nativamente'),
        ],
      ),
    );
  }
}
