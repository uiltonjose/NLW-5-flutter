import 'package:devquiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_images.dart';
import '../../../core/app_text_styles.dart';

class QuizCardWidget extends StatelessWidget {
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
            child: Image.asset(AppImages.blocks),
          ),
          SizedBox(height: 20),
          Text(
            'Gerenciamento de estado',
            style: AppTextStyles.heading15,
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  ' 3 de 10',
                  style: AppTextStyles.body11,
                ),
              ),
              Expanded(
                flex: 2,
                child: ProgressIndicatorWidget(value: 0.3),
              )
            ],
          )
        ],
      ),
    );
  }
}
