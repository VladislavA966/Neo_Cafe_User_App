import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neo_cafe_24/features/branches/domain/entity/branch_entity.dart';
import 'package:neo_cafe_24/features/branches/domain/use_case/get_branch.dart';

part 'single_branch_event.dart';
part 'single_branch_state.dart';

class SingleBranchBloc extends Bloc<SingleBranchEvent, SingleBranchState> {
  final BranchUseCase useCase;
  SingleBranchBloc(this.useCase) : super(SingleBranchInitial()) {
    on<GetSingleBranchEvent>(_branchInfoEvent);
  }

  FutureOr<void> _branchInfoEvent(
      GetSingleBranchEvent event, Emitter<SingleBranchState> emit) async {
    emit(SingleBranchLoading());
    try {
      final branch = await useCase.call(BranchParams(id: event.id));
      emit(
        SingleBranchLoaded(branch: branch),
      );
    } catch (e) {
      emit(
        SingleBranchError(
          errorText: e.toString(),
        ),
      );
    }
  }
}
