import 'package:devquiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/app_text_styles.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  const QuestionIndicatorWidget({
    Key? key,
    required this.currentPage,
    required this.pageCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Questão $currentPage', style: AppTextStyles.body),
              Text('de $pageCount', style: AppTextStyles.body),
            ],
          ),
          SizedBox(height: 16),
          ProgressIndicatorWidget(value: currentPage / pageCount),
        ],
      ),
    );
  }
}
