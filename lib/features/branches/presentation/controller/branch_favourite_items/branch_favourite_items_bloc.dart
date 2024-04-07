import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neo_cafe_24/features/branches/domain/use_case/get_all_branches_use_case.dart';
import 'package:neo_cafe_24/features/branches/domain/use_case/get_branch_favourite_items.dart';
import 'package:neo_cafe_24/features/menu_screen/domain/entity/item_entity.dart';

part 'branch_favourite_items_event.dart';
part 'branch_favourite_items_state.dart';

class BranchFavouriteItemsBloc
    extends Bloc<BranchFavouriteItemsEvent, BranchFavouriteItemsState> {
  final GetFavouriteItemsUseCase useCase;
  BranchFavouriteItemsBloc(this.useCase)
      : super(BranchFavouriteItemsInitial()) {
    on<GetFavouriteItemsEvent>(getFavouriteItemsEvent);
  }
  void getFavouriteItemsEvent(GetFavouriteItemsEvent event,
      Emitter<BranchFavouriteItemsState> emit) async {
    emit(BranchFavouriteItemsLoading());
    try {
      final items = await useCase(
        NoParams(),
      );
      emit(
        BranchFavouriteItemsLoaded(
          items: items,
        ),
      );
    } catch (e) {
      emit(
        BranchFavouriteItemsError(
          errorText: e.toString(),
        ),
      );
    }
  }
}
