import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/features/widgets/circle_button.dart';

class MenuContainer extends StatefulWidget {
  final String image;
  final String title;
  const MenuContainer({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  State<MenuContainer> createState() => _MenuContainerState();
}

class _MenuContainerState extends State<MenuContainer> {
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
            Image.asset(widget.image),
            const SizedBox(
              height: 12,
            ),
            Text(
              widget.title,
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

class ButtonsRow extends StatelessWidget {
  final int counter;
  final Function() onMinusTap;
  final Function() onPlusTap;
  const ButtonsRow(
      {super.key,
      required this.counter,
      required this.onMinusTap,
      required this.onPlusTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleButton(
          width: 36,
          height: 36,
          onTap: onMinusTap,
          color: AppColors.grey,
          icon: Icons.remove,
          iconSize: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '$counter',
            style: AppFonts.s16w600.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
        CircleButton(
          iconSize: 15,
          width: 36,
          height: 36,
          color: AppColors.orange,
          icon: Icons.add,
          onTap: onPlusTap,
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
