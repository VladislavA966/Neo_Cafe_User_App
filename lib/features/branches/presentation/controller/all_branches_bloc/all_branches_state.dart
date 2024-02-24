part of 'all_branches_bloc.dart';

@immutable
sealed class AllBranchesState {}

final class AllBranchesInitial extends AllBranchesState {}

final class AllBranchesLoading extends AllBranchesState {}

final class AllBranchesLoaded extends AllBranchesState {
  final List<BranchEntity> branches;

  AllBranchesLoaded({required this.branches});
}

final class AllBranchesError extends AllBranchesState {
  final String errorText;

  AllBranchesError({required this.errorText});
}
