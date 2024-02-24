part of 'all_branches_bloc.dart';

@immutable
sealed class AllBranchesEvent {}

class GetAllBranchesEvent extends AllBranchesEvent {}
