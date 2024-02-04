import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/core/recources/app_images.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/presentation/screens/sign_in_body.dart';
import 'package:neo_cafe_24/features/auth/create_new_proifle/presentation/screens/sign_up_body.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final signInEmailController = TextEditingController();
  final signUpEmailController = TextEditingController();
  final nameController = TextEditingController();
  final dateController = TextEditingController();
  int? currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(140.0),
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(16)),
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.coffeeBeans),
                      ),
                    ),
                    child: AppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: AppColors.mainColors,
                      elevation: 0,
                      title: Text(
                        currentIndex == 0 ? 'Вход' : 'Регистрация',
                        style: AppFonts.s32w600.copyWith(
                          color: AppColors.textWhite,
                        ),
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
                    child: Image.asset(
                      AppImages.appBarBeanBottom,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: currentIndex == 0
                ? SignInBody(
                    signInEmailController: signInEmailController,
                  )
                : SignUpBody(
                    nameController: nameController,
                    signUpEmailController: signUpEmailController,
                    dateController: dateController),
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
