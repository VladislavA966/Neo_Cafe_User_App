
import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final Function() onPressed;
  final String title;
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
          backgroundColor: AppColors.black,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: AppFonts.s16w600.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}