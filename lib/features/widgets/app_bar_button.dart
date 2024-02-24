import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';

class AppBarButton extends StatelessWidget {
  final Widget icon;
  final Function() onPressed;
  final Color color;

  const AppBarButton(
      {super.key,
      required this.icon,
      required this.onPressed,
      this.color = AppColors.black});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: icon,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
