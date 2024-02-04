import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/core/recources/app_images.dart';
import 'package:neo_cafe_24/features/auth/widgets/custom_button.dart';
import 'package:pinput/pinput.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SingInCodeScreen extends StatefulWidget {
  const SingInCodeScreen({super.key});

  @override
  State<SingInCodeScreen> createState() => _SingInCodeScreenState();
}

class _SingInCodeScreenState extends State<SingInCodeScreen> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 40,
      height: 52,
      textStyle: const TextStyle(
          fontSize: 20, color: AppColors.black, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: AppColors.grey,
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: AppColors.grey,
      ),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: AppColors.grey,
      ),
    );

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: _buildAppBar(),
          body: _buildBody(defaultPinTheme, focusedPinTheme, submittedPinTheme),
        ),
        _buildToggleSwitch(),
      ],
    );
  }

  PreferredSize _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(140.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.coffeeBeans),
                  fit: BoxFit.cover,
                ),
              ),
              child: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.mainColors,
                elevation: 0,
                title: Text(
                  'Вход',
                  style: AppFonts.s32w600.copyWith(color: AppColors.textWhite),
                ),
                centerTitle: true,
              ),
            ),
            Positioned(
              right: 10,
              child: Image.asset(AppImages.appBarBeanTop),
            ),
            Positioned(
              bottom: 0,
              right: 10,
              child: Image.asset(AppImages.appBarBeanBottom),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildBody(PinTheme defaultPinTheme, PinTheme focusedPinTheme,
      PinTheme submittedPinTheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 64,
            ),
            _buildTextInfo(),
            const SizedBox(
              height: 36,
            ),
            _buildPinPut(defaultPinTheme, focusedPinTheme, submittedPinTheme),
            const SizedBox(
              height: 36,
            ),
            CustomButton(
              title: 'Подтвердить',
              onPressed: () {},
              height: 48,
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }

  Column _buildTextInfo() {
    return const Column(
      children: [
        Text(
          'Введите 4-х значный код,',
          style: AppFonts.s16w600,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'отправленный на example@gmail.com',
          style: AppFonts.s16w600,
        ),
      ],
    );
  }

  Pinput _buildPinPut(PinTheme defaultPinTheme, PinTheme focusedPinTheme,
      PinTheme submittedPinTheme) {
    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      validator: (s) => s == '2222' ? null : 'Pin is incorrect',
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => print(pin),
    );
  }

  Positioned _buildToggleSwitch() {
    return Positioned(
      top: 156,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ToggleSwitch(
          minWidth: double.infinity,
          minHeight: 48,
          cornerRadius: 100,
          activeBgColors: const [
            [AppColors.orange],
            [AppColors.orange]
          ],
          activeFgColor: Colors.white,
          inactiveBgColor: AppColors.grey,
          inactiveFgColor: Colors.black,
          initialLabelIndex: 0,
          totalSwitches: 2,
          labels: const ['Войти', 'Регистрация'],
          radiusStyle: true,
          onToggle: (index) {},
        ),
      ),
    );
  }
}
