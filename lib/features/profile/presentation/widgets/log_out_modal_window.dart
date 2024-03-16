import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/data/data_source/local_data_source/local_data_source.dart';
import 'package:neo_cafe_24/features/auth/auth_screen.dart';
import 'package:neo_cafe_24/features/auth/widgets/custom_button.dart';
import 'package:neo_cafe_24/features/branches/data/data_source/local/branch_local_data.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/presentation/view/cart_screen.dart';

class LogountModalWindow extends StatelessWidget {
  const LogountModalWindow({
    super.key,
    required this.logout,
    required this.branchLocal,
  });

  final LocalDataSource logout;
  final BranchLocalData branchLocal;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Выход',
              style: AppFonts.s24w600.copyWith(color: AppColors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Уверены, что хотите выйти?',
              textAlign: TextAlign.center,
              style: AppFonts.s14w600.copyWith(color: AppColors.black),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: OpacityButton(
                    borderColor: AppColors.black,
                    title: 'Нет',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomButton(
                    title: 'Да',
                    onPressed: () {
                      branchLocal.removeId();
                      logout.deleteAllTokens();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthScreen(),
                        ),
                        (Route<dynamic> route) => false,
                      );
                    },
                    height: 54,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
