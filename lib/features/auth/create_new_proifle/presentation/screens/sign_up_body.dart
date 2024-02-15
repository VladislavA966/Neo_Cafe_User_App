import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_cafe_24/core/recources/app_images.dart';
import 'package:neo_cafe_24/core/services/dio_settings.dart';
import 'package:neo_cafe_24/features/auth/create_new_proifle/presentation/bloc/sign_up_bloc.dart';
import 'package:neo_cafe_24/features/auth/create_new_proifle/presentation/screens/sign_up_code_screen.dart';
import 'package:neo_cafe_24/features/auth/widgets/auth_text_field.dart';
import 'package:neo_cafe_24/features/auth/widgets/custom_button.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({
    super.key,
  });

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  String? _errorText;
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 64,
        ),
        _buildEmailTextField(),
        const SizedBox(
          height: 26,
        ),
        _buildButton(context)
      ],
    );
  }

  BlocListener<SignUpBloc, SignUpState> _buildButton(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoaded) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SingUpCodeScreen(
                emailController: controller.text,
              ),
            ),
          );
        } else if (state is ValidationError) {
          _errorText = state.errorText;
          setState(() {});
          controller.clear();
        } else if (state is SignUpError) {
          _errorText = state.errorText;
        }
      },
      child: CustomButton(
        title: 'Получить код',
        onPressed: () async {
          if (controller.text.isEmpty) {
            setState(
              () {
                _errorText = 'Поле не может быть пустым';
              },
            );
          } else {
            BlocProvider.of<SignUpBloc>(context).add(
              SendNewUserDataEvent(email: 'davisa3730@tospage.com'),
            );
            setState(() {
              _errorText = null;
            });
          }
        },
        height: 48,
      ),
    );
  }

  RegistrationTextField _buildEmailTextField() {
    return RegistrationTextField(
      errorText: _errorText,
      controller: controller,
      hintText: _errorText == null ? 'example@gmail.com' : 'Неверная почта',
      prefixImage: AppImages.emailSymbol,
    );
  }
}
