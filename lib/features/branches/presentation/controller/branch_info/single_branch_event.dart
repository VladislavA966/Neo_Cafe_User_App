part of 'single_branch_bloc.dart';

@immutable
sealed class SingleBranchEvent {}

class GetSingleBranchEvent extends SingleBranchEvent {
  final int id;

  GetSingleBranchEvent({required this.id});
}
