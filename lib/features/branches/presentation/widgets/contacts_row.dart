import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';

class ContactsRow extends StatelessWidget {
  final String name;
  final String image;
  const ContactsRow({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(image),
        const SizedBox(width: 10),
        Text(
          name,
          style: AppFonts.s16w400.copyWith(color: AppColors.black),
        ),
      ],
    );
  }
}
