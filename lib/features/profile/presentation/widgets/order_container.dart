import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/core/recources/app_images.dart';

class OrderContainer extends StatelessWidget {
  final Function()? onPressed;
  const OrderContainer({
    super.key,
    this.onPressed,
  });
  List<BoxShadow> get shadows => const [
        BoxShadow(
          color: Color(0x14000000),
          blurRadius: 16,
          offset: Offset(0, 8),
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Color(0x0A000000),
          blurRadius: 4,
          offset: Offset(0, 0),
          spreadRadius: 0,
        ),
      ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 99,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            shadows: shadows),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 95,
              height: 95,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                image: const DecorationImage(
                  image: AssetImage(AppImages.item),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
                bottom: 8,
              ),
              child: _buildInfoColumn(),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildInfoColumn() {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Neo Cafe Derzinka,',
                  style: AppFonts.s14w600.copyWith(
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Латте, капучино, Багров...,',
                  style: AppFonts.s12w400.copyWith(
                    color: AppColors.black,
                  ),
                ),
                const Spacer(),
                Text(
                  'Сейчас',
                  style: AppFonts.s14w600.copyWith(
                    color: AppColors.orange,
                  ),
                ),
              ],
            );
  }
}
