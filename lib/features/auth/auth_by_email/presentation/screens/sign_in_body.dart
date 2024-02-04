import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_images.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/presentation/screens/sign_in_code_screen.dart';
import 'package:neo_cafe_24/features/auth/widgets/auth_text_field.dart';
import 'package:neo_cafe_24/features/auth/widgets/custom_button.dart';

class SignInBody extends StatelessWidget {
  final TextEditingController signInEmailController;

  const SignInBody({
    super.key,
    required this.signInEmailController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 64,
        ),
        _buildRegistrationTextField(),
        const SizedBox(
          height: 56,
        ),
        _buildButton(context),
      ],
    );
  }

  CustomButton _buildButton(BuildContext context) {
    return CustomButton(
      height: 48,
      title: 'Получить код',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SingInCodeScreen(),
          ),
        );
      },
    );
  }

  RegistrationTextField _buildRegistrationTextField() {
    return const RegistrationTextField(
      hintText: 'Введите почту',
      prefixImage: AppImages.emailSymbol,
    );
  }
}
