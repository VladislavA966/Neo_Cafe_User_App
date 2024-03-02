import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/features/auth/widgets/custom_button.dart';
import 'package:neo_cafe_24/features/branches/presentation/controller/branch_info/single_branch_bloc.dart';
import 'package:neo_cafe_24/features/branches/presentation/widgets/popular_branch_item.dart';
import 'package:neo_cafe_24/features/menu_screen/presentation/widgets/info_app_bar.dart';
import 'package:neo_cafe_24/features/widgets/app_bar_button.dart';
import 'package:url_launcher/url_launcher.dart';

class BranchInfoScreen extends StatefulWidget {
  final int id;
  const BranchInfoScreen({super.key, required this.id});

  @override
  State<BranchInfoScreen> createState() => _BranchInfoScreenState();
}

class _BranchInfoScreenState extends State<BranchInfoScreen> {
  bool isExpanded = false;

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $launchUri';
    }
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print('Не могу открыть $url');
    }
  }

  void toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  String phone = '';
  String url = '';
  @override
  void initState() {
    BlocProvider.of<SingleBranchBloc>(context).add(
      GetSingleBranchEvent(id: widget.id),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  BlocBuilder _buildBody(BuildContext context) {
    return BlocBuilder<SingleBranchBloc, SingleBranchState>(
      builder: (context, state) {
        if (state is SingleBranchLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SingleBranchLoaded) {
          phone = state.branch.phoneNumber;
          url = state.branch.link2gis;
          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      _buildName(state),
                      const SizedBox(
                        height: 12,
                      ),
                      _buildAdress(state),
                      const SizedBox(
                        height: 24,
                      ),
                      _buildPhoneAnd2GisLingButtons(),
                      const SizedBox(
                        height: 26,
                      ),
                      _buildScheduleTitle(),
                      _buildScheduleContainer(state),
                      const SizedBox(height: 32),
                      _buildPopularItemsTitle(),
                      const SizedBox(height: 16),
                      _buildPopularItemsList(),
                      const SizedBox(height: 48),
                      _buildMenuButton(),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  CustomButton _buildMenuButton() {
    return CustomButton(
      title: 'Перейти в меню',
      onPressed: () {},
      height: 54,
    );
  }

  Widget _buildPopularItemsList() {
    return SizedBox(
      height: 225,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(right: 16),
            child: PopularBranchItem(),
          );
        },
      ),
    );
  }

  Text _buildPopularItemsTitle() {
    return Text(
      'Популярные блюда',
      style: AppFonts.s20w600.copyWith(
        color: AppColors.black,
      ),
    );
  }

  AnimatedContainer _buildScheduleContainer(SingleBranchLoaded state) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
      height: isExpanded ? min(state.branch.schedules.length * 20.0, 200.0) : 0,
      child: Expanded(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: isExpanded ? state.branch.schedules.length : 0,
          itemBuilder: (context, index) {
            return Text(
              '${state.branch.schedules[index].day}: ${state.branch.schedules[index].startTime} - ${state.branch.schedules[index].endTime}',
              style: AppFonts.s16w400.copyWith(
                color: AppColors.black,
              ),
            );
          },
        ),
      ),
    );
  }

  Row _buildScheduleTitle() {
    return Row(
      children: [
        Text(
          'График работы :',
          style: AppFonts.s16w400.copyWith(
            color: AppColors.black,
          ),
        ),
        const Spacer(),
        IconButton(
          icon: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
          onPressed: toggleExpanded,
        ),
      ],
    );
  }

  Row _buildPhoneAnd2GisLingButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppBarButton(
          color: AppColors.orange,
          icon: Image.asset(
            'assets/images/mdi_phone-outline.png',
          ),
          onPressed: () {
            _makePhoneCall(phone);
          },
        ),
        AppBarButton(
          color: AppColors.orange,
          icon: Image.asset('assets/images/mdi_map-marker-outline.png'),
          onPressed: () {
            _launchURL(url);
          },
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Text _buildAdress(SingleBranchLoaded state) {
    return Text(
      state.branch.adress,
      style: AppFonts.s16w400.copyWith(
        color: AppColors.black,
      ),
    );
  }

  Text _buildName(SingleBranchLoaded state) {
    return Text(
      state.branch.branchName,
      style: AppFonts.s20w600.copyWith(
        color: AppColors.black,
      ),
    );
  }

  InfoAppBar _buildAppBar(BuildContext context) {
    return InfoAppBar(
      image: 'assets/images/big_branch_image.png',
      appBarHeight: MediaQuery.of(context).size.height * 0.23,
    );
  }
}
