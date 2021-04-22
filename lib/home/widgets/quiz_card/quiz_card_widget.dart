import 'package:flutter/material.dart';

import 'package:devquiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_text_styles.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String image;
  final String completed;
  final double percent;

  const QuizCardWidget({
    Key? key,
    required this.title,
    required this.image,
    required this.completed,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            child: Image.asset(image),
          ),
          SizedBox(height: 20),
          Text(
            title,
            style: AppTextStyles.heading15,
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  completed,
                  style: AppTextStyles.body11,
                ),
              ),
              Expanded(
                flex: 2,
                child: ProgressIndicatorWidget(value: percent),
              )
            ],
          )
        ],
      ),
    );
  }
}
