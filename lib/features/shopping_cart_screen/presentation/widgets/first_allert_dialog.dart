import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/features/auth/widgets/custom_button.dart';
import 'package:neo_cafe_24/features/profile/presentation/controller/bloc/profile_bloc.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/presentation/controller/new_order_bloc/new_order_bloc.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/presentation/widgets/opacity_button.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/presentation/widgets/secons_allert_dialog.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/presentation/widgets/third_dialog.dart';

class FirstBonusDialog extends StatelessWidget {
  const FirstBonusDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            _buildTitle(),
            const SizedBox(height: 16),
            _buildSecondTitle(bonusPoints),
            const SizedBox(height: 24),
            _buildButtonsRow(context),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Row _buildButtonsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BlocConsumer<NewOrderBloc, NewOrderState>(
          listener: (context, state) {
            if (state is NewOrderLoaded) {
              _showThirdDialog(context);
            }
          },
          builder: (context, state) {
            return _buildNoButton(context);
          },
        ),
        const SizedBox(width: 16),
        _buildYesButton(context),
      ],
    );
  }

  Expanded _buildYesButton(BuildContext context) {
    return Expanded(
        child: CustomButton(
          title: 'Да',
          onPressed: () => _showSecondDialog(context),
          height: 54,
        ),
      );
  }

  Expanded _buildNoButton(BuildContext context) {
    return Expanded(
            child: OpacityButton(
              title: 'Нет',
              borderColor: AppColors.black,
              onPressed: () => _sendNewOrder(context),
            ),
          );
  }

  Text _buildSecondTitle(int bonusPoints) {
    return Text(
      'У вас есть $bonusPoints бонусов, хотите\nих списать?',
      textAlign: TextAlign.center,
      style: AppFonts.s14w600.copyWith(color: AppColors.black),
    );
  }

  Text _buildTitle() {
    return Text(
      'Списание бонусов',
      style: AppFonts.s24w600.copyWith(color: AppColors.black),
      textAlign: TextAlign.center,
    );
  }

  void _showThirdDialog(BuildContext context) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) => const ThirdDialog(),
    );
  }

  void _sendNewOrder(BuildContext context) {
    BlocProvider.of<NewOrderBloc>(context).add(
      SendNewOrderEvent(bonusPoints: 0),
    );
  }

  void _showSecondDialog(BuildContext context) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) => const SecondBonusDialog(),
    );
  }
}
