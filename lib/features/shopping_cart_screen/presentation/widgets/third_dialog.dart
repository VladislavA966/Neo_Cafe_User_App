import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/features/auth/widgets/custom_button.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/presentation/controller/bloc/cart_bloc.dart';

class ThirdDialog extends StatelessWidget {
  const ThirdDialog({
    super.key,
  });

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
              'Списание бонусов',
              style: AppFonts.s24w600.copyWith(color: AppColors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Ваш заказ принят',
              textAlign: TextAlign.center,
              style: AppFonts.s14w600.copyWith(color: AppColors.black),
            ),
            const SizedBox(height: 24),
            CustomButton(
              title: 'Отлично!',
              onPressed: () {
                BlocProvider.of<CartBloc>(context).add(CleanCartEvent());
                Navigator.pop(context);
              },
              height: 54,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
