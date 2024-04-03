import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_cafe_24/core/recources/app_images.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/presentation/bloc/sign_in_bloc.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/presentation/screens/sign_in_code_screen.dart';
import 'package:neo_cafe_24/features/auth/widgets/auth_text_field.dart';
import 'package:neo_cafe_24/features/auth/widgets/custom_button.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({
    super.key,
  });

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final controller = TextEditingController();

  String? _errorText;
  String _hintText = 'Введите почту';

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
          height: 36,
        ),
        _buildButton(context),
      ],
    );
  }

  BlocConsumer _buildButton(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInLoaded) {
          _goToSendCodeScreen(context);
        } else if (state is SignInError) {
          _errorText = state.errorText;
          controller.text = '';
          _hintText = 'Неправильная почта';
          setState(() {});
        } else if (state is SignInValidationError) {
          _errorText = state.errorText;
          _hintText = 'Неправильная почта';
        }
      },
      builder: (context, state) {
        if (state is SignInLoading) {
          return const CircularProgressIndicator();
        }

        return CustomButton(
          height: 48,
          title: 'Получить код',
          onPressed: () {
            _sendCodeForAuth(context);
            setState(() {});
          },
        );
      },
    );
  }

  void _goToSendCodeScreen(BuildContext context) {
     Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SingInCodeScreen(
          email: controller.text,
        ),
      ),
    );
  }

  void _sendCodeForAuth(BuildContext context) {
    BlocProvider.of<SignInBloc>(context).add(
      SendEmailForSingInEvent(email: controller.text),
    );
  }

  RegistrationTextField _buildRegistrationTextField() {
    return RegistrationTextField(
      keyboardType: TextInputType.emailAddress,
      errorText: _errorText,
      controller: controller,
      hintText: _hintText,
      prefixImage: AppImages.emailSymbol,
    );
  }
}
