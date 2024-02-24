import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_images.dart';
import 'package:neo_cafe_24/features/auth/widgets/auth_text_field.dart';
import 'package:neo_cafe_24/features/auth/widgets/custom_button.dart';
import 'package:neo_cafe_24/features/widgets/app_bar_button.dart';
import 'package:neo_cafe_24/features/widgets/custom_app_bar.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  Padding _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 40),
          _buildNameField(),
          _buildEmailField(),
          const SizedBox(height: 56),
          _buildSaveButton()
        ],
      ),
    );
  }

  CustomButton _buildSaveButton() => CustomButton(
        title: 'Сохранить',
        onPressed: () {},
        height: 48,
      );

  RegistrationTextField _buildEmailField() {
    return RegistrationTextField(
        hintText: 'user@example.com',
        prefixImage: AppImages.emailSymbol,
        controller: emailController);
  }

  RegistrationTextField _buildNameField() {
    return RegistrationTextField(
        hintText: 'Иван',
        prefixImage: AppImages.emailSymbol,
        controller: emailController);
  }

  MyAppBar _buildAppBar(BuildContext context) {
    return MyAppBar(
      title: 'Редактирование',
      leading: AppBarButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.textWhite,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
