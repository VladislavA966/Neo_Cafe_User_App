import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/presentation/screens/sign_in_body.dart';
import 'package:neo_cafe_24/features/auth/create_new_proifle/presentation/screens/sign_up_body.dart';
import 'package:neo_cafe_24/features/widgets/custom_app_bar.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int? currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: MyAppBar(
            title: currentIndex == 0 ? 'Вход' : 'Регистрация',
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: currentIndex == 0 ? const SignInBody() : const SignUpBody(),
          ),
        ),
        Positioned(
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
              initialLabelIndex: currentIndex,
              totalSwitches: 2,
              labels: const ['Войти', 'Регистрация'],
              radiusStyle: true,
              onToggle: (index) {
                currentIndex = index;
                setState(() {});
              },
            ),
          ),
        ),
      ],
    );
  }
}
