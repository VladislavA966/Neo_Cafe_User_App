import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_images.dart';
import 'package:neo_cafe_24/features/auth/create_new_proifle/presentation/screens/sign_up_code_screen.dart';
import 'package:neo_cafe_24/features/auth/widgets/auth_text_field.dart';
import 'package:neo_cafe_24/features/auth/widgets/custom_button.dart';

class SignUpBody extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController signUpEmailController;
  final TextEditingController dateController;
  const SignUpBody(
      {super.key,
      required this.nameController,
      required this.signUpEmailController,
      required this.dateController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 64,
        ),
        _buildNameTextField(),
        const SizedBox(
          height: 16,
        ),
        _buildEmailTextField(),
        const SizedBox(
          height: 16,
        ),
        _buildDateTextField(),
        const SizedBox(
          height: 56,
        ),
        _buildButton(context)
      ],
    );
  }

  CustomButton _buildButton(BuildContext context) {
    return CustomButton(
      title: 'Получить код',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SingUpCodeScreen(),
          ),
        );
      },
      height: 48,
    );
  }

  RegistrationTextField _buildDateTextField() {
    return const RegistrationTextField(
      hintText: '01.01.1999',
      prefixImage: AppImages.emailSymbol,
    );
  }

  RegistrationTextField _buildEmailTextField() {
    return const RegistrationTextField(
      hintText: 'example@gmail.com',
      prefixImage: AppImages.emailSymbol,
    );
  }

  RegistrationTextField _buildNameTextField() {
    return const RegistrationTextField(
        hintText: 'Иван', prefixImage: AppImages.emailSymbol);
  }
}
