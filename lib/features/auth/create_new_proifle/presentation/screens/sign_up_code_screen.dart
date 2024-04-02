import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/features/auth/auth_screen.dart';
import 'package:neo_cafe_24/features/auth/create_new_proifle/presentation/bloc/sign_up_bloc.dart';
import 'package:neo_cafe_24/features/widgets/custom_app_bar.dart';
import 'package:neo_cafe_24/features/auth/widgets/custom_button.dart';
import 'package:pinput/pinput.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SingUpCodeScreen extends StatefulWidget {
  final String emailController;
  const SingUpCodeScreen({super.key, required this.emailController});

  @override
  State<SingUpCodeScreen> createState() => _SingUpCodeScreenState();
}

class _SingUpCodeScreenState extends State<SingUpCodeScreen> {
  final controllerPin = TextEditingController();
  final int _currentToggleIndex = 1;
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
          body: _buildBody(
            defaultPinTheme,
            focusedPinTheme,
            submittedPinTheme,
          ),
        ),
        _buildToggleSwitch(),
      ],
    );
  }

  MyAppBar _buildAppBar() {
    return const MyAppBar(title: 'Регистрация');
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
            BlocListener<SignUpBloc, SignUpState>(
              listener: (context, state) {
                if (state is CodeSended) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AuthScreen(),
                    ),
                  );
                } else if (state is CodeError) {}
              },
              child: CustomButton(
                title: 'Подтвердить',
                onPressed: () async {
                  BlocProvider.of<SignUpBloc>(context).add(
                    SendSignUpCodeEvent(
                        email: widget.emailController,
                        code: controllerPin.text),
                  );
                },
                height: 48,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            BlocBuilder<SignUpBloc, SignUpState>(
              builder: (context, state) {
                if (state is SignUpError) {
                  return TextButton(
                    onPressed: () {
                      BlocProvider.of<SignUpBloc>(context).add(
                        SendNewUserDataEvent(email: widget.emailController),
                      );
                    },
                    child: Text(
                      'Отправить еще раз',
                      style: AppFonts.s16w600.copyWith(color: AppColors.orange),
                    ),
                  );
                }
                return const Text('Отправить еще раз');
              },
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }

  BlocBuilder _buildTextInfo() {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        if (state is SignUpError) {
          return Text(
            'Код введен неверно,\n попробуйте еще раз',
            textAlign: TextAlign.center,
            style: AppFonts.s16w600.copyWith(color: Colors.red),
          );
        }
        return Text(
          'Введите 4-х значный код,\n отправленный на ${widget.emailController}',
          textAlign: TextAlign.center,
          style: AppFonts.s16w600,
        );
      },
    );
  }

  Pinput _buildPinPut(PinTheme defaultPinTheme, PinTheme focusedPinTheme,
      PinTheme submittedPinTheme) {
    return Pinput(
      controller: controllerPin,
      cursor: Container(
        width: 20,
        height: 2,
        color: Colors.black,
        margin: const EdgeInsets.only(top: 30),
      ),
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
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
          initialLabelIndex: _currentToggleIndex,
          totalSwitches: 2,
          labels: const ['Войти', 'Регистрация'],
          radiusStyle: true,
          onToggle: (index) {},
          cancelToggle: (index) {
            return Future(() => true);
          },
        ),
      ),
    );
  }
}
