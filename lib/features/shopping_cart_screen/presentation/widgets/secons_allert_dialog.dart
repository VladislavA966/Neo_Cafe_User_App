import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/features/auth/widgets/custom_button.dart';
import 'package:neo_cafe_24/features/profile/presentation/controller/bloc/profile_bloc.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/presentation/controller/new_order_bloc/new_order_bloc.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/presentation/view/cart_screen.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/presentation/widgets/third_dialog.dart';

class SecondBonusDialog extends StatelessWidget {
  const SecondBonusDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bonusController = TextEditingController();
    final profileState = context.read<ProfileBloc>().state;
    int bonusPoints = 0;
    if (profileState is ProfileLoaded) {
      bonusPoints = profileState.model.bonusPoints;
    }
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
              'Ваши бонусы: $bonusPoints',
              style: AppFonts.s24w600.copyWith(color: AppColors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Введите количество бонусов\nкоторое хотите списать',
              textAlign: TextAlign.center,
              style: AppFonts.s14w600.copyWith(color: AppColors.black),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: TextField(
                controller: bonusController,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.black)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.grey)),
                  filled: true,
                  fillColor: AppColors.grey,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: OpacityButton(
                    title: 'Отмена',
                    borderColor: AppColors.black,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: BlocListener<NewOrderBloc, NewOrderState>(
                    listener: (context, state) {
                      if (state is NewOrderLoaded) {
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (context) => const ThirdDialog(),
                        );
                        BlocProvider.of<ProfileBloc>(context).add(
                          ProfileInfoEvent(),
                        );
                      }
                    },
                    child: CustomButton(
                      title: 'Списать',
                      onPressed: () {
                        BlocProvider.of<NewOrderBloc>(context).add(
                          SendNewOrderEvent(
                            bonusPoints:
                                int.tryParse(bonusController.text) ?? 0,
                          ),
                        );
                      },
                      height: 54,
                    ),
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
