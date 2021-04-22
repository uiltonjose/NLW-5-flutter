import 'package:devquiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWdiget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color labelColor;
  final Color borderColor;
  final VoidCallback onTap;

  const NextButtonWdiget({
    required this.label,
    required this.backgroundColor,
    required this.labelColor,
    required this.borderColor,
    required this.onTap,
  });

  NextButtonWdiget.green({required String label, required VoidCallback onTap})
      : this.label = label,
        this.backgroundColor = AppColors.darkGreen,
        labelColor = AppColors.white,
        this.borderColor = AppColors.darkGreen,
        this.onTap = onTap;

  NextButtonWdiget.white({required String label, required VoidCallback onTap})
      : this.label = label,
        this.backgroundColor = AppColors.white,
        labelColor = AppColors.grey,
        this.borderColor = AppColors.grey,
        this.onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(backgroundColor),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              side: MaterialStateProperty.all(BorderSide(color: borderColor))),
          onPressed: onTap,
          child: Text(label,
              style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: labelColor,
              ))),
    );
  }
}
