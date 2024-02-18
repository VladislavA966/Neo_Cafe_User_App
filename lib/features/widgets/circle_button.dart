import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final Function()? onTap;
  final double height;
  final double width;
  final double iconSize;
  const CircleButton({
    super.key,
    required this.color,
    required this.icon,
    required this.onTap,
    required this.height,
    required this.width,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(8),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Icon(
          icon,
          size: iconSize,
        ),
      ),
    );
  }
}
