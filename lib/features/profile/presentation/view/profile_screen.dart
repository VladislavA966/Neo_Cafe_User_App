import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_cafe_24/core/dependensies/di.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/core/recources/app_images.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/data/data_source/local_data_source/local_data_source.dart';
import 'package:neo_cafe_24/features/auth/auth_screen.dart';
import 'package:neo_cafe_24/features/auth/widgets/custom_button.dart';
import 'package:neo_cafe_24/features/branches/data/data_source/local/branch_local_data.dart';
import 'package:neo_cafe_24/features/profile/presentation/controller/bloc/profile_bloc.dart';
import 'package:neo_cafe_24/features/profile/presentation/view/edit_profile.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen.dart/presentation/view/cart_screen.dart';
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

  Padding _buildBody(ProfileLoaded state) {
    return Padding(
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
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
          const SizedBox(height: 16),
          const OrderContainer(),
          const SizedBox(height: 32),
          Text(
            'Завершенные',
            style: AppFonts.s16w600.copyWith(color: AppColors.black),
          ),
          const SizedBox(height: 16),
          const OrderContainer(),
          const SizedBox(height: 12),
          const OrderContainer(),
        ],
      ),
    );
  }

  MyAppBar _buildAppBar() {
    return const MyAppBar(
      title: 'Профиль',
      centerTitle: false,
    );
  }
}

class LogountModalWindow extends StatelessWidget {
  const LogountModalWindow({
    super.key,
    required this.logout,
    required this.branchLocal,
  });

  final LocalDataSource logout;
  final BranchLocalData branchLocal;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Выход',
              style: AppFonts.s24w600.copyWith(color: AppColors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Уверены, что хотите выйти?',
              textAlign: TextAlign.center,
              style: AppFonts.s14w600.copyWith(color: AppColors.black),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: OpacityButton(
                    borderColor: AppColors.black,
                    title: 'Нет',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomButton(
                    title: 'Да',
                    onPressed: () {
                      branchLocal.removeId();
                      logout.deleteAllTokens();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthScreen(),
                        ),
                        (Route<dynamic> route) => false,
                      );
                    },
                    height: 54,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class OrderContainer extends StatelessWidget {
  final Function()? onPressed;
  const OrderContainer({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 99,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 16,
              offset: Offset(0, 8),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 4,
              offset: Offset(0, 0),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 95,
              height: 95,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                image: const DecorationImage(
                  image: AssetImage(AppImages.item),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
                bottom: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Neo Cafe Derzinka,',
                    style: AppFonts.s14w600.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Латте, капучино, Багров...,',
                    style: AppFonts.s12w400.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Сейчас',
                    style: AppFonts.s14w600.copyWith(
                      color: AppColors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
