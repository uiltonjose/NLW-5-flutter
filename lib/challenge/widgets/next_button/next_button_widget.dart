import 'package:devquiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWdiget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color labelColor;

  const NextButtonWdiget({
    required this.label,
    required this.backgroundColor,
    required this.labelColor,
  });

  NextButtonWdiget.green({required String label})
      : this.label = label,
        this.backgroundColor = AppColors.darkGreen,
        labelColor = AppColors.white;

  NextButtonWdiget.white({required String label})
      : this.label = label,
        this.backgroundColor = AppColors.white,
        labelColor = AppColors.grey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(backgroundColor),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              )),
          onPressed: () {},
          child: Text(label,
              style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: labelColor,
              ))),
    );
  }
}