import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/presentation/bloc/sign_in_bloc.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/screens/main_screen.dart';
import 'package:neo_cafe_24/features/widgets/custom_app_bar.dart';
import 'package:neo_cafe_24/features/auth/widgets/custom_button.dart';
import 'package:neo_cafe_24/features/widgets/navigation_bar.dart';
import 'package:pinput/pinput.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SingInCodeScreen extends StatefulWidget {
  final String email;
  const SingInCodeScreen({super.key, required this.email});

  @override
  State<SingInCodeScreen> createState() => _SingInCodeScreenState();
}

class _SingInCodeScreenState extends State<SingInCodeScreen> {
  final controller = TextEditingController();
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
    return const MyAppBar(title: 'Вход');
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
            BlocListener<SignInBloc, SignInState>(
              listener: (context, state) {
                if (state is SendCodeLoaded) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                } else if (state is SignInError) {
                  print(state.errorText);
                }
              },
              child: CustomButton(
                title: 'Подтвердить',
                onPressed: () {
                  BlocProvider.of<SignInBloc>(context).add(
                    SendCodeForSingInEvent(widget.email, code: controller.text),
                  );
                  // final dio = Dio();
                  // final responce = await dio.post(
                  //   'https://tokyo-backender.org.kg/customer/register/',
                  //   data: {
                  //     "email": 'v.afonin.1996@icloud.com',

                  //   },
                  // );
                  // if (responce.statusCode == 201 ||
                  //     responce.statusCode == 200) {
                  //   print('Регистратия прошла успешно');
                  // } else if (responce.statusCode == 400) {
                  //   print("Ошибка ${responce.statusCode}");
                  // }
                },
                height: 48,
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }

  Column _buildTextInfo() {
    return Column(
      children: [
        const Text(
          'Введите 4-х значный код,',
          style: AppFonts.s16w600,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'отправленный на ${widget.email}',
          style: AppFonts.s16w600,
        ),
      ],
    );
  }

  Pinput _buildPinPut(PinTheme defaultPinTheme, PinTheme focusedPinTheme,
      PinTheme submittedPinTheme) {
    return Pinput(
      cursor: Container(
        width: 20,
        height: 2,
        color: Colors.black,
        margin: const EdgeInsets.only(top: 30),
      ),
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      controller: controller,
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
          cancelToggle: (index) {
            return Future(() => true);
          },
        ),
      ),
    );
  }
}
