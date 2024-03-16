import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/features/branches/presentation/controller/all_branches_bloc/all_branches_bloc.dart';
import 'package:neo_cafe_24/features/branches/presentation/controller/branch_info/single_branch_bloc.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/widgets/branch_container.dart';

class BranchesWindow extends StatelessWidget {
  const BranchesWindow({
    super.key,
  });
  void getBranchInfoEvent(
      BuildContext context, AllBranchesLoaded state, int index) {
    BlocProvider.of<SingleBranchBloc>(context).add(
      GetSingleBranchEvent(
        id: state.branches[index].id,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      _buildTitle(),
                      const SizedBox(height: 28),
                      _buildBranchesList(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          _buildRedButton(context),
        ],
      ),
    );
  }

  Positioned _buildRedButton(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: 56,
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          clipBehavior: Clip.antiAlias,
          decoration: const ShapeDecoration(
            color: Color(0xFFF35555),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
            ),
          ),
          child: const Icon(
            Icons.close,
            color: AppColors.textWhite,
          ),
        ),
      ),
    );
  }

  Expanded _buildBranchesList() {
    return Expanded(
      child: BlocBuilder<AllBranchesBloc, AllBranchesState>(
        builder: (context, state) {
          if (state is AllBranchesLoaded) {
            return ListView.builder(
              itemCount: state.branches.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: BranchContainer(
                  onTap: () {
                    getBranchInfoEvent(context, state, index);
                    Navigator.pop(context);
                  },
                  name: state.branches[index].branchName,
                ),
              ),
            );
          } else if (state is AllBranchesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Text _buildTitle() {
    return Text(
      'Выберите филиал',
      style: AppFonts.s24w600.copyWith(color: AppColors.black),
    );
  }
}
