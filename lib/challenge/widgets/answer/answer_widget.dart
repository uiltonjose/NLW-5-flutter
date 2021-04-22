import 'package:devquiz/shared/models/answer.dart';
import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_text_styles.dart';

class AnswerWidget extends StatelessWidget {
  final Answer answer;
  final bool isSelected;
  final bool isDisabled;
  final VoidCallback onTap;

  const AnswerWidget({
    Key? key,
    required this.answer,
    required this.onTap,
    this.isSelected = false,
    this.isDisabled = false,
  }) : super(key: key);

  Color get _selectedColorCorrect =>
      answer.isCorrect ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderCorrect =>
      answer.isCorrect ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardCorrect =>
      answer.isCorrect ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardCorrect =>
      answer.isCorrect ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleCorrect => answer.isCorrect
      ? AppTextStyles.bodyDarkGreen
      : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconCorrect =>
      answer.isCorrect ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: IgnorePointer(
        ignoring: isDisabled,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isSelected ? _selectedColorCardCorrect : AppColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.fromBorderSide(
                  BorderSide(
                      color: isSelected
                          ? _selectedBorderCardCorrect
                          : AppColors.border),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      answer.title,
                      style: isSelected
                          ? _selectedTextStyleCorrect
                          : AppTextStyles.body,
                    ),
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color:
                          isSelected ? _selectedColorCorrect : AppColors.white,
                      borderRadius: BorderRadius.circular(500),
                      border: Border.fromBorderSide(
                        BorderSide(
                            color: isSelected
                                ? _selectedBorderCorrect
                                : AppColors.border),
                      ),
                    ),
                    child: isSelected
                        ? Icon(
                            _selectedIconCorrect,
                            size: 16,
                            color: Colors.white,
                          )
                        : null,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
