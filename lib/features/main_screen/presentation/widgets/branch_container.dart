import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';

class BranchContainer extends StatelessWidget {
  final VoidCallback onTap;
  final String name;
  const BranchContainer({
    super.key,
    required this.name,
    required this.onTap,
  });
  List<BoxShadow> get shadows => const [
        BoxShadow(
          color: Color(0x0F000000),
          blurRadius: 8,
          offset: Offset(0, 4),
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
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 176,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: shadows,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 100,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/branch_asset.png"),
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: AppFonts.s16w600.copyWith(
                  color: AppColors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
