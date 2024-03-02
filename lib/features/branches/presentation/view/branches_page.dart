import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_cafe_24/core/recources/app_images.dart';
import 'package:neo_cafe_24/features/branches/presentation/controller/all_branches_bloc/all_branches_bloc.dart';
import 'package:neo_cafe_24/features/branches/presentation/controller/branch_info/single_branch_bloc.dart';
import 'package:neo_cafe_24/features/branches/presentation/view/branch_info_screen.dart';
import 'package:neo_cafe_24/features/branches/presentation/widgets/branch_info_container.dart';
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
