import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';

class CustomText extends StatelessWidget {
  final String firstText;
  final String secondText;
  const CustomText({
    super.key,
    required this.firstText,
    required this.secondText,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: firstText,
        style: AppFonts.s16w600.copyWith(
          color: AppColors.black,
        ),
        children: [
          TextSpan(
            text: secondText,
            style: AppFonts.s20w600.copyWith(
              color: AppColors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
