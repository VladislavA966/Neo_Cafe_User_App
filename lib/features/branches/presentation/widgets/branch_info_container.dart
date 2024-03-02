import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/features/branches/presentation/widgets/contacts_row.dart';

class BranchInfoContainer extends StatelessWidget {
  final String name;
  final String address;
  final String phoneNumber;

  final Function() onTap;
  const BranchInfoContainer({
    super.key,
    required this.onTap,
    required this.name,
    required this.address,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            14,
          ),
          boxShadow: const [
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
            )
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 16, bottom: 12, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset('assets/images/branch_image.png'),
              ),
              const SizedBox(height: 12),
              Text(
                name,
                style: AppFonts.s20w600.copyWith(
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 26),
              ContactsRow(
                image: 'assets/images/map_marker.png',
                name: address,
              ),
              const SizedBox(
                height: 12,
              ),
              ContactsRow(name: phoneNumber, image: 'assets/images/phone.png')
            ],
          ),
        ),
      ),
    );
  }
}
