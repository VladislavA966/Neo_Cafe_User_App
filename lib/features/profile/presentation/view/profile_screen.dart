import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_cafe_24/core/dependensies/di.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/core/recources/app_images.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/data/data_source/local_data_source/local_data_source.dart';
import 'package:neo_cafe_24/features/branches/data/data_source/local/branch_local_data.dart';
import 'package:neo_cafe_24/features/profile/presentation/controller/bloc/profile_bloc.dart';
import 'package:neo_cafe_24/features/profile/presentation/view/edit_profile.dart';
import 'package:neo_cafe_24/features/profile/presentation/widgets/log_out_modal_window.dart';
import 'package:neo_cafe_24/features/profile/presentation/widgets/order_container.dart';
import 'package:neo_cafe_24/features/widgets/app_bar_button.dart';
import 'package:neo_cafe_24/features/widgets/custom_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    BlocProvider.of<ProfileBloc>(context).add(
      ProfileInfoEvent(),
    );
    super.initState();
  }

  final removeId = getIt<BranchLocalData>();
  final logout = getIt<LocalDataSource>();

  void editProfileNavigator() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EditProfileScreen(),
      ),
    );
  }

  void showLogOurDialog() {
    showDialog(
      context: context,
      builder: (context) => LogountModalWindow(
        logout: logout,
        branchLocal: removeId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoaded) {
          return Stack(
            children: [
              Scaffold(
                appBar: _buildAppBar(),
                body: _buildBody(state),
              ),
              _buildAppBarButton(context),
              _buildNameContainer(context, state)
            ],
          );
        } else if (state is ProfileError) {
          return Center(
            child: Text(state.errorText),
          );
        }
        return const SizedBox();
      },
    );
  }

  Positioned _buildAppBarButton(BuildContext context) {
    return Positioned(
      right: 0,
      top: 60,
      child: AppBarButton(
          icon: Image.asset(AppImages.logoutIcon), onPressed: showLogOurDialog),
    );
  }

  Positioned _buildNameContainer(BuildContext context, ProfileLoaded state) {
    return Positioned(
      top: 160,
      left: 16,
      right: 16,
      child: Container(
        padding: const EdgeInsets.only(
          top: 24,
          left: 24,
          right: 20,
          bottom: 25,
        ),
        height: 78,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.lightBlue,
          borderRadius: BorderRadius.circular(
            100,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              state.model.firstName,
              style: AppFonts.s24w600.copyWith(
                color: AppColors.black,
              ),
            ),
            GestureDetector(
              onTap: editProfileNavigator,
              child: Image.asset(
                'assets/images/pencil.png',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(ProfileLoaded state) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 62,
            ),
            Container(
              width: double.infinity,
              height: 110,
              decoration: BoxDecoration(
                color: AppColors.pink,
                borderRadius: BorderRadius.circular(
                  24,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Бонусы',
                          style: AppFonts.s24w600.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                        Text(
                          '${state.model.bonusPoints}',
                          style:
                              AppFonts.s24w600.copyWith(color: AppColors.black),
                        )
                      ],
                    ),
                    Image.asset(AppImages.bonusImage),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Актуальный заказ',
              style: AppFonts.s16w600.copyWith(color: AppColors.black),
            ),
          ],
        ),
      ),
    );
  }

  MyAppBar _buildAppBar() {
    return MyAppBar(
      title: 'Профиль',
      centerTitle: false,
    );
  }
}
