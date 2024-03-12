import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';

class CustomRadiusButton extends StatelessWidget {
  final Function()? onPressed;
  final IconData? icon;
  const CustomRadiusButton(
      {super.key, required this.onPressed, this.icon = Icons.add});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 56,
        height: 40,
        padding: const EdgeInsets.only(top: 7, left: 16, right: 16, bottom: 9),
        clipBehavior: Clip.antiAlias,
        decoration: const ShapeDecoration(
          color: AppColors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
