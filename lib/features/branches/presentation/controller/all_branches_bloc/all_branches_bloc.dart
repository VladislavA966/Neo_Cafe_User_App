import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neo_cafe_24/features/branches/domain/entity/branch_entity.dart';
import 'package:neo_cafe_24/features/branches/domain/use_case/get_all_branches_use_case.dart';

part 'all_branches_event.dart';
part 'all_branches_state.dart';

class AllBranchesBloc extends Bloc<AllBranchesEvent, AllBranchesState> {
  final GetAllBranchesUseCase useCase;
  AllBranchesBloc(this.useCase) : super(AllBranchesInitial()) {
    on<GetAllBranchesEvent>(_allBranchesEvent);
  }

  FutureOr<void> _allBranchesEvent(event, emit) async {
    emit(AllBranchesLoading());
    try {
      final model = await useCase.call(NoParams());
      emit(
        AllBranchesLoaded(branches: model),
      );
    } catch (e) {
      emit(AllBranchesError(errorText: e.toString()));
    }
  }
}
