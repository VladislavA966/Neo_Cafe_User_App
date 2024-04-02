import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_images.dart';
import 'package:neo_cafe_24/features/auth/widgets/auth_text_field.dart';
import 'package:neo_cafe_24/features/auth/widgets/custom_button.dart';
import 'package:neo_cafe_24/features/profile/presentation/controller/bloc/profile_bloc.dart';
import 'package:neo_cafe_24/features/widgets/app_bar_button.dart';
import 'package:neo_cafe_24/features/widgets/custom_app_bar.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final controller = TextEditingController();
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
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileLoaded) {
            Navigator.pop(context);
            _showSnackBar(context);
          }
        },
        builder: (context, state) {
          if (state is ProfileLoaded) {
            return _buildLoadedState(state);
          }
          return const SizedBox();
        },
      ),
    );
  }

  Column _buildLoadedState(ProfileLoaded state) {
    return Column(
      children: [
        const SizedBox(height: 40),
        _buildNameField(state),
        const SizedBox(height: 56),
        _buildSaveButton()
      ],
    );
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Данные успешно изменены"),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.fixed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }

  CustomButton _buildSaveButton() => CustomButton(
        title: 'Сохранить',
        onPressed: () => _editProfileInfo(),
        height: 48,
      );

  void _editProfileInfo() {
    BlocProvider.of<ProfileBloc>(context).add(
      EditProfileInfoEvent(
        firstName: controller.text,
      ),
    );
  }

  RegistrationTextField _buildNameField(ProfileLoaded state) {
    return RegistrationTextField(
      hintText: state.model.firstName,
      prefixImage: AppImages.emailSymbol,
      controller: controller,
    );
  }

  MyAppBar _buildAppBar(BuildContext context) {
    return MyAppBar(
      title: 'Редактирование',
      leading: AppBarButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.textWhite,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
