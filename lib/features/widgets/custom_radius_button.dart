import 'package:flutter/material.dart';

class CustomRadiusButton extends StatelessWidget {
  const CustomRadiusButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 40,
      padding: const EdgeInsets.only(top: 7, left: 16, right: 16, bottom: 9),
      clipBehavior: Clip.antiAlias,
      decoration: const ShapeDecoration(
        color: Color(0xFFF37255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
        ),
      ),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
