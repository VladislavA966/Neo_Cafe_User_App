import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/features/auth/widgets/custom_button.dart';
import 'package:neo_cafe_24/features/profile/presentation/controller/bloc/profile_bloc.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/presentation/controller/new_order_bloc/new_order_bloc.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/presentation/widgets/opacity_button.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/presentation/widgets/third_dialog.dart';

class SecondBonusDialog extends StatefulWidget {
  const SecondBonusDialog({
    super.key,
  });

  @override
  State<SecondBonusDialog> createState() => _SecondBonusDialogState();
}

class _SecondBonusDialogState extends State<SecondBonusDialog> {
  final bonusController = TextEditingController();

  String? errorText;
  @override
  Widget build(BuildContext context) {
    final profileState = context.read<ProfileBloc>().state;
    int bonusPoints = 0;
    if (profileState is ProfileLoaded) {
      bonusPoints = profileState.model.bonusPoints;
    }
    void onBonusChanged(String? value) {
      final bonusValue = int.tryParse(value ?? '') ?? 0;
      if (bonusPoints < bonusValue) {
        if (errorText == null) {
          setState(() {
            errorText = 'Недостаточно бонусов';
          });
        }
      } else {
        if (errorText != null) {
          setState(() {
            errorText = null;
          });
        }
      }
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
            _buildBonusTitle(bonusPoints),
            const SizedBox(height: 16),
            _buildSecondBonusTitle(),
            const SizedBox(height: 24),
            BonusTextField(
                onChanged: (value) => onBonusChanged(value),
                bonusController: bonusController,
                errorText: errorText),
            const SizedBox(height: 20),
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
        _buildCancelButton(context),
        const SizedBox(width: 16),
        _buildAccecssButton(context),
      ],
    );
  }

  Expanded _buildAccecssButton(BuildContext context) {
    return Expanded(
      child: BlocListener<NewOrderBloc, NewOrderState>(
        listener: (context, state) {
          if (state is NewOrderLoaded) {
            Navigator.pop(context);
            _showOrderConfirmedDialog(context);
          }
        },
        child: CustomButton(
          title: 'Списать',
          onPressed: () => errorText == null
              ? _createNewOrderEvent(context, bonusController)
              : null,
          height: 54,
        ),
      ),
    );
  }

  Expanded _buildCancelButton(BuildContext context) {
    return Expanded(
      child: OpacityButton(
        title: 'Отмена',
        borderColor: AppColors.black,
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Text _buildSecondBonusTitle() {
    return Text(
      'Введите количество бонусов\nкоторое хотите списать',
      textAlign: TextAlign.center,
      style: AppFonts.s14w600.copyWith(color: AppColors.black),
    );
  }

  Text _buildBonusTitle(int bonusPoints) {
    return Text(
      'Ваши бонусы: $bonusPoints',
      style: AppFonts.s24w600.copyWith(color: AppColors.black),
      textAlign: TextAlign.center,
    );
  }

  void _createNewOrderEvent(
      BuildContext context, TextEditingController bonusController) {
    BlocProvider.of<NewOrderBloc>(context).add(
      SendNewOrderEvent(
        bonusPoints: int.tryParse(bonusController.text) ?? 0,
      ),
    );
  }

  void _showOrderConfirmedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const ThirdDialog(),
    );
    BlocProvider.of<ProfileBloc>(context).add(
      ProfileInfoEvent(),
    );
  }
}

class BonusTextField extends StatelessWidget {
  final Function(String value) onChanged;
  const BonusTextField(
      {super.key,
      required this.bonusController,
      required this.errorText,
      required this.onChanged});

  final TextEditingController bonusController;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextField(
        onChanged: onChanged,
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
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          errorText: errorText,
        ),
      ),
    );
  }
}
