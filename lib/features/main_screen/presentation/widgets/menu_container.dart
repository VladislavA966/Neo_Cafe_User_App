import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';

class MenuContainer extends StatelessWidget {
  final String image;
  final String title;
  const MenuContainer({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 109,
        decoration: BoxDecoration(
          color: AppColors.yellow,
          borderRadius: BorderRadius.circular(
            14,
          ),
        ),
        child: Center(
          child: Column(children: [
            const SizedBox(
              height: 16,
            ),
            Image.asset(image),
            const SizedBox(
              height: 12,
            ),
            Text(
              title,
              style: AppFonts.s14w600.copyWith(
                color: AppColors.black,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
