import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/shared/models/answer.dart';
import 'package:devquiz/shared/models/question.dart';
import 'package:flutter/material.dart';

import '../../../core/app_text_styles.dart';

class QuizWidgets extends StatefulWidget {
  final Question question;
  final ValueChanged<bool> onSelected;

  const QuizWidgets({
    Key? key,
    required this.question,
    required this.onSelected,
  }) : super(key: key);

  @override
  _QuizWidgetsState createState() => _QuizWidgetsState();
}

class _QuizWidgetsState extends State<QuizWidgets> {
  int indexSelected = -1;

  Answer answer(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          for (var i = 0; i < widget.question.answers.length; i++)
            AnswerWidget(
              answer: answer(i),
              isSelected: indexSelected == i,
              isDisabled: indexSelected != -1,
              onTap: (isCorrect) {
                setState(() {
                  indexSelected = i;
                });
                Future.delayed(Duration(seconds: 1)).then(
                  (_) => widget.onSelected(isCorrect),
                );
              },
            ),
        ],
      ),
    );
  }
}
