part of 'single_branch_bloc.dart';

@immutable
sealed class SingleBranchState {}

final class SingleBranchInitial extends SingleBranchState {}

final class SingleBranchLoading extends SingleBranchState {}

final class SingleBranchLoaded extends SingleBranchState {
  final BranchEntity branch;

  SingleBranchLoaded({required this.branch});
}

final class SingleBranchError extends SingleBranchState {
  final String errorText;

  SingleBranchError({required this.errorText});
}
