import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/features/widgets/custom_radius_button.dart';

class PopularMenuContainer extends StatelessWidget {
  final String name;
  final int price;
  final int quantity;
  final void Function()? onTap;

  final Widget buttonWidget;
  const PopularMenuContainer(
      {super.key,
      required this.onTap,
      required this.buttonWidget,
      required this.name,
      required this.price,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 99,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              shadows: const [
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
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 86,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    image: const DecorationImage(
                      image:
                          NetworkImage("https://via.placeholder.com/80x90  "),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Карамельный раф,',
                        style: AppFonts.s14w600.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Большой кокосовое молоко,',
                        style: AppFonts.s12w400.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '270 c',
                        style: AppFonts.s14w600.copyWith(
                          color: AppColors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        buttonWidget,
        Positioned(
          right: 0,
          bottom: 0,
          child: CustomRadiusButton(
            onPressed: () {
              print('ddobavleno');
            },
          ),
        ),
      ],
    );
  }
}
