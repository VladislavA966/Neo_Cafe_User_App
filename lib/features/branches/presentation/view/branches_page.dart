import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/core/recources/app_images.dart';
import 'package:neo_cafe_24/features/branches/presentation/controller/all_branches_bloc/all_branches_bloc.dart';
import 'package:neo_cafe_24/features/branches/presentation/controller/branch_info/single_branch_bloc.dart';
import 'package:neo_cafe_24/features/branches/presentation/view/branch_info_screen.dart';
import 'package:neo_cafe_24/features/widgets/app_bar_button.dart';
import 'package:neo_cafe_24/features/widgets/custom_app_bar.dart';

class BranchesScreen extends StatefulWidget {
  const BranchesScreen({super.key});

  @override
  State<BranchesScreen> createState() => _BranchesScreenState();
}

class _BranchesScreenState extends State<BranchesScreen> {
  @override
  void initState() {
    BlocProvider.of<AllBranchesBloc>(context).add(GetAllBranchesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Padding _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          _buildBranchesList()
        ],
      ),
    );
  }

  BlocBuilder _buildBranchesList() {
    return BlocBuilder<AllBranchesBloc, AllBranchesState>(
      builder: (context, state) {
        if (state is AllBranchesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AllBranchesLoaded) {
          return Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.branches.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 12,
                    ),
                    child: BranchInfoContainer(
                      onTap: () {
                        BlocProvider.of<SingleBranchBloc>(context).add(
                          GetSingleBranchEvent(id: state.branches[index].id),
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BranchInfoScreen(
                              id: state.branches[index].id,
                            ),
                          ),
                        );
                      },
                      name: state.branches[index].branchName,
                      address: state.branches[index].adress,
                      phoneNumber: state.branches[index].phoneNumber,
                    ),
                  );
                }),
          );
        }
        return const SizedBox();
      },
    );
  }

  MyAppBar _buildAppBar() {
    return MyAppBar(
      title: 'Филлиалы',
      centerTitle: false,
      actions: [
        AppBarButton(icon: Image.asset(AppImages.clipBoard), onPressed: () {})
      ],
    );
  }
}

class BranchInfoContainer extends StatelessWidget {
  final String name;
  final String address;
  final String phoneNumber;

  final Function() onTap;
  const BranchInfoContainer({
    super.key,
    required this.onTap,
    required this.name,
    required this.address,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            14,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0F000000),
              blurRadius: 8,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 4,
              offset: Offset(0, 0),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 16, bottom: 12, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset('assets/images/branch_image.png'),
              ),
              const SizedBox(height: 12),
              Text(
                name,
                style: AppFonts.s20w600.copyWith(
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 26),
              ContactsRow(
                image: 'assets/images/map_marker.png',
                name: address,
              ),
              const SizedBox(
                height: 12,
              ),
              ContactsRow(name: phoneNumber, image: 'assets/images/phone.png')
            ],
          ),
        ),
      ),
    );
  }
}

class ContactsRow extends StatelessWidget {
  final String name;
  final String image;
  const ContactsRow({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(image),
        const SizedBox(width: 10),
        Text(
          name,
          style: AppFonts.s16w400.copyWith(color: AppColors.black),
        ),
      ],
    );
  }
}
